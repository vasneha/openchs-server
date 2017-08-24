package org.openchs.dao;

import org.joda.time.DateTime;
import org.openchs.domain.Concept;
import org.openchs.domain.ConceptAnswer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.core.annotation.RestResource;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@RepositoryRestResource(collectionResourceRel = "conceptAnswer", path = "conceptAnswer")
public interface ConceptAnswerRepository extends PagingAndSortingRepository<ConceptAnswer, Long> {
    @RestResource(path = "lastModified", rel = "lastModified")
    Page<ConceptAnswer> findByLastModifiedDateTimeGreaterThanOrderByLastModifiedDateTimeAscIdAsc(@Param("lastModifiedDateTime") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) DateTime lastModifiedDateTime, Pageable pageable);
}