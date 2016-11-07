package org.openchs.domain;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Map;

@Entity
@Table(name = "individual")
public class Individual extends CHSEntity {
    @NotNull
    private String name;

    @NotNull
    private LocalDate dateOfBirth;

    @NotNull
    private boolean dateOfBirthEstimated;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "gender_id")
    private Gender gender;

    @Column
    private long catchment_id;

    @Column
    @Type(type = "KeyValuesJson")
    private Object profile;

    @Column
    @Type(type = "KeyValuesJson")
    private Object address;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public boolean isDateOfBirthEstimated() {
        return dateOfBirthEstimated;
    }

    public void setDateOfBirthEstimated(boolean dateOfBirthEstimated) {
        this.dateOfBirthEstimated = dateOfBirthEstimated;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public long getCatchment_id() {
        return catchment_id;
    }

    public void setCatchment_id(long catchment_id) {
        this.catchment_id = catchment_id;
    }

    public Object getProfile() {
        return profile;
    }

    public void setProfile(Object profile) {
        this.profile = profile;
    }

    public Object getAddress() {
        return address;
    }

    public void setAddress(Map<String, Object> address) {
        this.address = address;
    }

    public static Individual create(String name, LocalDate dateOfBirth, boolean dateOfBirthEstimated, Gender gender, Object address) {
        Individual individual = new Individual();
        individual.name = name;
        individual.dateOfBirth = dateOfBirth;
        individual.dateOfBirthEstimated = dateOfBirthEstimated;
        individual.gender = gender;
        individual.address = address;
        return individual;
    }
}