package org.openchs.web;

import org.openchs.builder.LocationBuilder;
import org.openchs.builder.BuilderException;
import org.openchs.dao.AddressLevelTypeRepository;
import org.openchs.dao.LocationRepository;
import org.openchs.dao.OrganisationRepository;
import org.openchs.domain.AddressLevel;
import org.openchs.domain.AddressLevelType;
import org.openchs.framework.security.UserContextHolder;
import org.openchs.web.request.LocationContract;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.transaction.Transactional;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
public class LocationController {

    private final AddressLevelTypeRepository addressLevelTypeRepository;
    private OrganisationRepository organisationRepository;
    private LocationRepository locationRepository;
    private Logger logger;

    @Autowired
    public LocationController(OrganisationRepository organisationRepository,
                              LocationRepository locationRepository,
                              AddressLevelTypeRepository addressLevelTypeRepository) {
        this.organisationRepository = organisationRepository;
        this.locationRepository = locationRepository;
        this.addressLevelTypeRepository = addressLevelTypeRepository;
        this.logger = LoggerFactory.getLogger(this.getClass());
    }

    @RequestMapping(value = "/locations", method = RequestMethod.POST)
    @PreAuthorize(value = "hasAnyAuthority('admin','organisation_admin')")
    @Transactional
    public ResponseEntity<?> save(@RequestBody List<LocationContract> locationContracts) {
        try {
            Map<String, AddressLevelType> typeMap = new HashMap<>();
            for (LocationContract locationContract : locationContracts) {
                logger.info(String.format("Processing location request: %s", locationContract.toString()));
                AddressLevelType type = typeMap.compute(locationContract.getType(), (k, v) -> v == null ? saveType(k) : v);
                saveLocation(locationContract, type);
            }
        } catch (BuilderException e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().body(e.getMessage());
        }
        return ResponseEntity.ok(null);
    }

    private AddressLevelType saveType(String type) {
        if (type == null) return null;
        AddressLevelType existingType = addressLevelTypeRepository.findByNameAndOrganisationId(type,
                UserContextHolder.getUserContext().getOrganisation().getId());
        if (existingType == null) {
            AddressLevelType addressLevelType = new AddressLevelType();
            addressLevelType.setName(type);
            addressLevelType.setUuid(UUID.randomUUID().toString());
            return addressLevelTypeRepository.save(addressLevelType);
        }
        return existingType;
    }

    private void saveLocation(LocationContract contract, AddressLevelType type) throws BuilderException {
        LocationBuilder locationBuilder = new LocationBuilder(locationRepository.findByUuid(contract.getUuid()), type);
        if (possibleDuplicate(contract)) {
            throw new BuilderException(String.format("Location{name='%s',level='%s',..} with different uuid exists", contract.getName(),contract.getLevel()));
        }
        locationBuilder.copy(contract);
        locationRepository.save(locationBuilder.build());
    }

    private boolean possibleDuplicate(LocationContract locationRequest) {
        List<AddressLevel> locations = locationRepository.findByTitleAndLevelAndUuidNot(locationRequest.getName(), locationRequest.getLevel(), locationRequest.getUuid());
        return !locations.isEmpty();
    }
}
