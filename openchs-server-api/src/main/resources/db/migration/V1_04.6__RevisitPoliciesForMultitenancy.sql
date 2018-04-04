-- Drop all existing policies
DROP POLICY IF EXISTS address_level_user ON address_level;
DROP POLICY IF EXISTS catchment_user ON catchment;
DROP POLICY IF EXISTS catchment_address_mapping_user ON catchment_address_mapping;
DROP POLICY IF EXISTS checklist_user ON checklist;
DROP POLICY IF EXISTS checklist_item_user ON checklist_item;
DROP POLICY IF EXISTS concept_user ON concept;
DROP POLICY IF EXISTS concept_answer_user ON concept_answer;
DROP POLICY IF EXISTS encounter_user ON encounter;
DROP POLICY IF EXISTS encounter_type_user ON encounter_type;
DROP POLICY IF EXISTS form_user ON form;
DROP POLICY IF EXISTS form_element_user ON form_element;
DROP POLICY IF EXISTS form_element_group_user ON form_element_group;
DROP POLICY IF EXISTS form_mapping_user ON form_mapping;
DROP POLICY IF EXISTS individual_user ON individual;
DROP POLICY IF EXISTS program_user ON program;
DROP POLICY IF EXISTS program_encounter_user ON program_encounter;
DROP POLICY IF EXISTS program_enrolment_user ON program_enrolment;
DROP POLICY IF EXISTS program_outcome_user ON program_outcome;
DROP POLICY IF EXISTS users_user ON users;
DROP POLICY IF EXISTS operational_encounter_type_user ON operational_encounter_type;
DROP POLICY IF EXISTS operational_operational_program ON operational_program;

-- Recursive policy for reference tables
CREATE POLICY address_level_orgs ON address_level USING (organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS ( SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs)) WITH CHECK ( organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS (SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs));
CREATE POLICY catchment_orgs ON catchment USING (organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS ( SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs)) WITH CHECK ( organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS (SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs));
CREATE POLICY catchment_address_mapping_orgs ON catchment_address_mapping USING (organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS ( SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs)) WITH CHECK ( organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS (SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs));
CREATE POLICY concept_orgs ON concept USING (organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS ( SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs)) WITH CHECK ( organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS (SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs));
CREATE POLICY concept_answer_orgs ON concept_answer USING (organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS ( SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs)) WITH CHECK ( organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS (SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs));
CREATE POLICY encounter_type_orgs ON encounter_type USING (organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS ( SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs)) WITH CHECK ( organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS (SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs));
CREATE POLICY form_orgs ON form USING (organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS ( SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs)) WITH CHECK ( organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS (SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs));
CREATE POLICY form_element_orgs ON form_element USING (organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS ( SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs)) WITH CHECK ( organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS (SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs));
CREATE POLICY form_element_group_orgs ON form_element_group USING (organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS ( SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs)) WITH CHECK ( organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS (SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs));
CREATE POLICY form_mapping_orgs ON form_mapping USING (organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS ( SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs)) WITH CHECK ( organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS (SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs));
CREATE POLICY individual_orgs ON individual USING (organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS ( SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs)) WITH CHECK ( organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS (SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs));
CREATE POLICY program_orgs ON program USING (organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS ( SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs)) WITH CHECK ( organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS (SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs));
CREATE POLICY program_outcome_orgs ON program_outcome USING (organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS ( SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs)) WITH CHECK ( organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS (SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs));
CREATE POLICY operational_encounter_type_orgs ON operational_encounter_type USING (organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS ( SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs)) WITH CHECK ( organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS (SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs));
CREATE POLICY operational_program_orgs ON operational_program USING (organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS ( SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs)) WITH CHECK ( organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS (SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs));
CREATE POLICY users_orgs ON users USING (organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS ( SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs)) WITH CHECK ( organisation_id IN (WITH RECURSIVE list_of_orgs(id, parent_organisation_id) AS (SELECT id, parent_organisation_id FROM organisation WHERE db_user = current_user UNION ALL SELECT o.id, o.parent_organisation_id FROM organisation o, list_of_orgs log WHERE o.id = log.parent_organisation_id ) SELECT id FROM list_of_orgs));

-- Exact organisation required for transactional tables
CREATE POLICY checklist_orgs ON checklist USING ((organisation_id = (select id from organisation where db_user = current_user))) WITH CHECK ((organisation_id = (select id from organisation where db_user = current_user)));
CREATE POLICY checklist_item_orgs ON checklist_item USING ((organisation_id = (select id from organisation where db_user = current_user))) WITH CHECK ((organisation_id = (select id from organisation where db_user = current_user)));
CREATE POLICY encounter_orgs ON encounter USING ((organisation_id = (select id from organisation where db_user = current_user))) WITH CHECK ((organisation_id = (select id from organisation where db_user = current_user)));
CREATE POLICY program_encounter_orgs ON program_encounter USING ((organisation_id = (select id from organisation where db_user = current_user))) WITH CHECK ((organisation_id = (select id from organisation where db_user = current_user)));
CREATE POLICY program_enrolment_orgs ON program_enrolment USING ((organisation_id = (select id from organisation where db_user = current_user))) WITH CHECK ((organisation_id = (select id from organisation where db_user = current_user)));
