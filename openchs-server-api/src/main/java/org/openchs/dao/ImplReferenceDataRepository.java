package org.openchs.dao;

import org.openchs.domain.CHSEntity;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.security.access.prepost.PreAuthorize;

@NoRepositoryBean
@PreAuthorize(value = "hasAnyAuthority('user', 'organisation_admin')")
public interface ImplReferenceDataRepository<T extends CHSEntity> extends ReferenceDataRepository<T> {

    @PreAuthorize("hasAnyAuthority('organisation_admin')")
    <S extends T> S save(S concept);
}
