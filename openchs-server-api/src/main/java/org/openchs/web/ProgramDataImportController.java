package org.openchs.web;

import org.openchs.service.DataImportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
public class ProgramDataImportController {
    private final DataImportService dataImportService;

    @Autowired
    public ProgramDataImportController(DataImportService dataImportService) {
        this.dataImportService = dataImportService;
    }

    @RequestMapping(value = "/excelImport", method = RequestMethod.POST)
    @PreAuthorize(value = "hasAnyAuthority('importer')")
    public ResponseEntity<?> uploadData(@RequestParam("metaDataFile") MultipartFile metaDataFile,
                                        @RequestParam MultipartFile dataFile,
                                        @RequestParam(required = false) Integer maxNumberOfRecords,
                                        @RequestParam List<Integer> activeSheets) throws Exception {
        dataImportService.importExcel(metaDataFile.getInputStream(), dataFile.getInputStream(), dataFile.getOriginalFilename(),true, maxNumberOfRecords, activeSheets);
        return new ResponseEntity<>(true, HttpStatus.CREATED);
    }
}
