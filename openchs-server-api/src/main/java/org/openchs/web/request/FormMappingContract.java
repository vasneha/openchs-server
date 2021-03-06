package org.openchs.web.request;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import org.openchs.domain.ConceptDataType;

import java.util.List;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({"name", "uuid", "dataType", "answers", "lowAbsolute", "highAbsolute", "lowNormal", "highNormal", "unit", "unique"})
public class FormMappingContract extends ReferenceDataContract {

    private String formUUID;
    private String programUUID;
    private String encounterTypeUUID;

    public String getFormUUID() {
        return formUUID;
    }

    public void setFormUUID(String formUUID) {
        this.formUUID = formUUID;
    }

    public String getProgramUUID() {
        return programUUID;
    }

    public void setProgramUUID(String programUUID) {
        this.programUUID = programUUID;
    }

    public String getEncounterTypeUUID() {
        return encounterTypeUUID;
    }

    public void setEncounterTypeUUID(String encounterTypeUUID) {
        this.encounterTypeUUID = encounterTypeUUID;
    }

    @Override
    public String toString() {
        return String.format("UUID: %s, formUUID: %s, programUUID: %s, encounterTypeUUID: %s", this.getUuid(), this.getFormUUID(), this.getProgramUUID(), this.getEncounterTypeUUID());
    }
}