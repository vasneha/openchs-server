package org.openchs.domain;

import org.hibernate.annotations.Type;
import org.openchs.application.Form;
import org.openchs.application.FormType;
import org.openchs.application.RuleEntity;
import org.openchs.application.RuleType;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity(name = "rule")
public class Rule extends OrganisationAwareEntity {
    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "form_id")
    private Form form;

    @NotNull
    @Column(name = "type")
    @Enumerated(EnumType.STRING)
    private RuleType type;

    @NotNull
    @Column(name = "name")
    private String name;

    @NotNull
    @Column(name = "fn_name")
    private String fnName;

    @Column
    @Type(type = "ruleData")
    private RuleData data;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "rule_dependency_id")
    private RuleDependency ruleDependency;

    public Form getForm() {
        return form;
    }

    public void setForm(Form form) {
        this.form = form;
    }

    public RuleType getType() {
        return type;
    }

    public void setType(RuleType type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public RuleData getData() {
        return data;
    }

    public void setData(RuleData data) {
        this.data = data;
    }

    public RuleDependency getRuleDependency() {
        return ruleDependency;
    }

    public void setRuleDependency(RuleDependency ruleDependency) {
        this.ruleDependency = ruleDependency;
    }

    public String getFnName() {
        return fnName;
    }

    public void setFnName(String fnName) {
        this.fnName = fnName;
    }
}