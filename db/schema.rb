# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120529135848) do

  create_table "actor_service_mappings", :force => true do |t|
    t.integer  "actor_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "service_group_id"
  end

  create_table "actors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "address_taggings", :force => true do |t|
    t.integer  "address_id"
    t.integer  "address_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "address_taggings", ["address_id", "address_type_id"], :name => "index_address_taggings_on_address_id_and_address_type_id"
  add_index "address_taggings", ["address_type_id"], :name => "index_address_taggings_on_address_type_id"

  create_table "address_type_groups", :force => true do |t|
    t.string   "addressable_type"
    t.integer  "address_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "address_types", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "addresses", :force => true do |t|
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city"
    t.string   "zip"
    t.integer  "state_id"
    t.integer  "county_id"
    t.text     "directions"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "addresses", ["addressable_id"], :name => "index_addresses_on_addressable_id"
  add_index "addresses", ["addressable_type"], :name => "index_addresses_on_addressable_type"

  create_table "administrative_answers", :force => true do |t|
    t.text     "choice_text"
    t.boolean  "choice_boolean"
    t.datetime "choice_date"
    t.integer  "administrative_question_id"
    t.integer  "administrative_review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "administrative_answers", ["administrative_question_id"], :name => "index_administrative_answers_on_administrative_question_id"
  add_index "administrative_answers", ["administrative_review_id", "deleted_at"], :name => "administrative_answers_id_delete_index"
  add_index "administrative_answers", ["administrative_review_id"], :name => "index_administrative_answers_on_administrative_review_id"
  add_index "administrative_answers", ["deleted_at"], :name => "index_administrative_answers_on_deleted_at"

  create_table "administrative_reviews", :force => true do |t|
    t.integer  "review_id"
    t.boolean  "completed",                             :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "administrative_reviews", ["completed"], :name => "index_administrative_reviews_on_completed"
  add_index "administrative_reviews", ["deleted_at"], :name => "index_administrative_reviews_on_deleted_at"
  add_index "administrative_reviews", ["review_id", "deleted_at"], :name => "index_administrative_reviews_on_review_id_and_deleted_at"
  add_index "administrative_reviews", ["review_id"], :name => "index_administrative_reviews_on_review_id"

  create_table "application_state_change_reasons", :force => true do |t|
    t.integer  "cltc_code"
    t.string   "name"
    t.text     "description"
    t.boolean  "hide"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "application_state_id"
    t.integer  "ordering"
  end

  add_index "application_state_change_reasons", ["application_state_id"], :name => "index_application_state_change_reasons_on_application_state_id"

  create_table "application_state_changes", :force => true do |t|
    t.integer  "client_application_id"
    t.integer  "application_state_change_reason_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.date     "effective_on"
    t.date     "starts_on"
    t.date     "ends_on"
    t.boolean  "time_limited_certification"
    t.integer  "care_level_id"
    t.integer  "nursing_home_facility_id"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "application_state_changes", ["application_state_change_reason_id"], :name => "index_on_state_change_reason"
  add_index "application_state_changes", ["client_application_id", "created_at"], :name => "index_on_app_id_and_created_at"

  create_table "application_states", :force => true do |t|
    t.string   "name"
    t.boolean  "considered_active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.string   "name_abbreviation"
  end

  create_table "approval_workflow_actions", :force => true do |t|
    t.string   "workflow_event"
    t.integer  "approval_workflow_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "approval_workflows", :force => true do |t|
    t.string   "approvable_type"
    t.string   "workflow_state"
    t.string   "type"
    t.integer  "approvable_id"
    t.boolean  "closed",                                :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "archived_case_load_upload_details", :force => true do |t|
    t.text     "data",                :limit => 2147483647
    t.integer  "case_load_upload_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "client_id"
    t.boolean  "data_changed",                              :default => false
    t.string   "status"
    t.string   "status_description"
  end

  create_table "area_users", :force => true do |t|
    t.integer "area_id"
    t.integer "user_id"
    t.integer "deleted_by"
    t.integer "deleted_at"
    t.boolean "active",     :default => false
  end

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city"
    t.string   "zip"
    t.string   "phone"
    t.string   "fax"
  end

  create_table "assessment_adls", :force => true do |t|
    t.integer  "assessment_id"
    t.integer  "transfer"
    t.integer  "locomotion"
    t.integer  "dressing"
    t.integer  "eating"
    t.integer  "toileting"
    t.integer  "bathing"
    t.integer  "bowel"
    t.integer  "bladder"
    t.integer  "medication"
    t.integer  "communication"
    t.integer  "financial"
    t.integer  "housework"
    t.integer  "shopping"
    t.integer  "transportation"
    t.integer  "escort"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
    t.boolean  "bathing_age_appropriate"
    t.boolean  "dressing_age_appropriate"
    t.boolean  "toileting_age_appropriate"
    t.boolean  "eating_age_appropriate"
    t.boolean  "locomotion_age_appropriate"
    t.boolean  "transfer_age_appropriate"
    t.boolean  "bowel_age_appropriate"
    t.boolean  "bladder_age_appropriate"
  end

  add_index "assessment_adls", ["assessment_id"], :name => "index_assessment_adls_on_assessment_id"

  create_table "assessment_behaviors", :force => true do |t|
    t.integer  "assessment_id"
    t.integer  "behavior_id"
    t.integer  "assessment_form_sub_section_id"
    t.integer  "level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "assessment_comments", :force => true do |t|
    t.integer  "assessment_id"
    t.integer  "assessment_sub_section_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "client_application_id"
    t.date     "assessed_on"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "assessment_comments", ["assessment_id"], :name => "index_assessment_comments_on_assessment_id"
  add_index "assessment_comments", ["assessment_sub_section_id"], :name => "index_assessment_comments_on_assessment_sub_section_id"

  create_table "assessment_conditions", :force => true do |t|
    t.integer  "assessment_id"
    t.integer  "condition_id"
    t.integer  "assessment_form_sub_section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "assessment_conditions", ["assessment_form_sub_section_id"], :name => "index_assessment_cond_form_sub_section_id"
  add_index "assessment_conditions", ["assessment_id"], :name => "index_assessment_conditions_on_assessment_id"
  add_index "assessment_conditions", ["condition_id"], :name => "index_assessment_conditions_on_condition_id"

  create_table "assessment_diagnoses", :force => true do |t|
    t.integer  "assessment_id"
    t.integer  "diagnosis_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "assessment_form_sections", :force => true do |t|
    t.string   "name"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "assessment_form_sub_sections", :force => true do |t|
    t.integer  "assessment_form_section_id"
    t.string   "name"
    t.string   "partial_name"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "commentable",                :default => true
    t.boolean  "required",                   :default => true
    t.boolean  "final",                      :default => false
  end

  create_table "assessment_hiv_diagnoses", :force => true do |t|
    t.integer  "assessment_id"
    t.integer  "hiv_diagnosis_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "assessment_information_sources", :force => true do |t|
    t.integer  "assessment_id"
    t.integer  "information_source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "assessment_mental_statuses", :force => true do |t|
    t.integer  "assessment_id"
    t.integer  "able_to_complete"
    t.integer  "location_name"
    t.integer  "location"
    t.integer  "date"
    t.integer  "month"
    t.integer  "year"
    t.integer  "age"
    t.integer  "month_born"
    t.integer  "year_born"
    t.integer  "president"
    t.integer  "previous_president"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "score"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "assessment_skin_markings", :force => true do |t|
    t.integer  "assessment_id"
    t.integer  "marking_type"
    t.integer  "x"
    t.integer  "y"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "assessment_skin_markings", ["assessment_id"], :name => "index_assessment_skin_markings_on_assessment_id"

  create_table "assessment_sub_sections", :force => true do |t|
    t.integer  "assessment_id"
    t.integer  "assessment_form_sub_section_id"
    t.integer  "assessment_form_section_id"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "assessment_sub_sections", ["assessment_form_sub_section_id", "assessment_form_section_id", "created_by"], :name => "index_on_form_section_and_sub_section_id"
  add_index "assessment_sub_sections", ["assessment_id"], :name => "index_assessment_sub_sections_on_assessment_id"

  create_table "assessment_treatments", :force => true do |t|
    t.integer  "assessment_id"
    t.integer  "treatment_id"
    t.integer  "frequency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "assessment_form_sub_section_id"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "assessments", :force => true do |t|
    t.integer  "care_level_id"
    t.datetime "completed_at"
    t.integer  "overall_condition"
    t.integer  "cd4_level"
    t.integer  "falls"
    t.integer  "er_visits"
    t.integer  "doctor_visits"
    t.integer  "hospital_admits"
    t.integer  "height"
    t.integer  "weight"
    t.integer  "lab_data"
    t.integer  "vital_signs"
    t.integer  "alone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "hearing"
    t.integer  "understood"
    t.integer  "understanding"
    t.integer  "speech"
    t.integer  "vision"
    t.integer  "short_term_memory"
    t.integer  "long_term_memory"
    t.integer  "cognitive_skill"
    t.date     "assessed_on"
    t.boolean  "phone_assessment"
    t.integer  "medications"
    t.integer  "recommended_care_level_id"
    t.text     "assessor_signature_data"
    t.text     "reviewer_signature_data"
    t.integer  "terminally_ill"
    t.integer  "able_to_stay_alone"
    t.date     "care_level_assigned_on"
    t.date     "assessor_signed_on"
    t.date     "reviewer_signed_on"
    t.integer  "at_risk_for_hospitalization"
    t.text     "central_office_signature_data"
    t.date     "central_office_signed_on"
    t.boolean  "dementia_registry_consent_signed"
    t.text     "skin_markings_image"
    t.integer  "client_application_id"
    t.integer  "declining_cd4_level"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
    t.boolean  "daily_medical_monitoring"
  end

  add_index "assessments", ["assessed_on"], :name => "assessed_on"
  add_index "assessments", ["client_application_id"], :name => "index_assessments_on_client_application_id"

  create_table "authorization_detail_dates", :force => true do |t|
    t.datetime "event_at"
    t.integer  "authorizable_id"
    t.string   "authorizable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "authorization_detail_days", :force => true do |t|
    t.integer  "day_id"
    t.integer  "units"
    t.integer  "authorizable_id"
    t.string   "authorizable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "authorization_detail_days", ["authorizable_id", "authorizable_type"], :name => "add_authorizable_index"

  create_table "authorization_detail_time_of_days", :force => true do |t|
    t.integer  "day_id"
    t.decimal  "units",                                 :precision => 5, :scale => 1
    t.integer  "authorizable_id"
    t.string   "authorizable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "morning"
    t.boolean  "afternoon"
    t.boolean  "evening"
    t.boolean  "new_record_waiting_to_be_uploaded",                                   :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded",                               :default => false
  end

  add_index "authorization_detail_time_of_days", ["authorizable_id", "authorizable_type"], :name => "adtod_authorizable_index"

  create_table "authorization_detail_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "partial"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "authorization_detail_unit_frequencies", :force => true do |t|
    t.decimal  "units",                                 :precision => 6, :scale => 2
    t.integer  "authorization_frequency_id"
    t.integer  "authorizable_id"
    t.string   "authorizable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",                                   :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded",                               :default => false
  end

  add_index "authorization_detail_unit_frequencies", ["authorizable_id", "authorizable_type"], :name => "aduf_authorizable_index"

  create_table "authorization_details", :force => true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.text     "termination_reason"
    t.integer  "authorizable_id"
    t.string   "authorizable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.decimal  "unit_cost",                             :precision => 6, :scale => 2
    t.text     "check_memo"
    t.boolean  "new_record_waiting_to_be_uploaded",                                   :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded",                               :default => false
  end

  add_index "authorization_details", ["authorizable_id", "authorizable_type", "end_at"], :name => "auth_detail_authorizable_end_at"
  add_index "authorization_details", ["authorizable_id", "authorizable_type"], :name => "auth_detail_authorizable"
  add_index "authorization_details", ["end_at"], :name => "index_authorization_details_on_end_at"

  create_table "authorization_frequencies", :force => true do |t|
    t.string   "name"
    t.boolean  "selectable", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "authorization_referrals", :force => true do |t|
    t.integer  "client_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.string   "status"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "authorizations", :force => true do |t|
    t.integer  "tracking_number"
    t.integer  "auth_units"
    t.string   "service_day"
    t.string   "service_checked"
    t.string   "visit_type"
    t.string   "missed_visit_code"
    t.decimal  "rate",                  :precision => 10, :scale => 2
    t.decimal  "total_units",           :precision => 10, :scale => 2
    t.decimal  "units_sunday",          :precision => 10, :scale => 2
    t.decimal  "units_monday",          :precision => 10, :scale => 2
    t.decimal  "units_tuesday",         :precision => 10, :scale => 2
    t.decimal  "units_wednesday",       :precision => 10, :scale => 2
    t.decimal  "units_thursday",        :precision => 10, :scale => 2
    t.decimal  "units_friday",          :precision => 10, :scale => 2
    t.decimal  "units_saturday",        :precision => 10, :scale => 2
    t.decimal  "unit_cost",             :precision => 10, :scale => 2
    t.boolean  "sup_morning"
    t.boolean  "sup_afternoon"
    t.boolean  "sup_evening"
    t.boolean  "hcn_ostomy"
    t.boolean  "hcn_catheter"
    t.boolean  "hcn_decub_wound"
    t.boolean  "hcn_trach"
    t.boolean  "hcn_tube"
    t.integer  "hcn_ostomy_id"
    t.integer  "hcn_catheter_id"
    t.integer  "hcn_decub_wound_id"
    t.integer  "hcn_trach_id"
    t.integer  "hcn_tube_id"
    t.string   "transfer_status"
    t.string   "check_memo"
    t.boolean  "bed"
    t.boolean  "dinette"
    t.boolean  "sofa"
    t.boolean  "chair"
    t.boolean  "dresser_chest"
    t.boolean  "nightstand"
    t.boolean  "phone"
    t.boolean  "water"
    t.boolean  "electricity"
    t.boolean  "gas"
    t.boolean  "microwave"
    t.boolean  "refrigerator"
    t.boolean  "washer"
    t.boolean  "dryer"
    t.boolean  "nebulizer_tx"
    t.integer  "nebulizer_tx_id"
    t.integer  "relationship_id"
    t.integer  "frequency"
    t.integer  "family"
    t.text     "termination_reason"
    t.integer  "authorization_type_id"
    t.integer  "sequence_number"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "faxed_at"
    t.integer  "area_id"
    t.integer  "client_id"
    t.integer  "provided_service_id"
    t.integer  "service_program_id"
    t.integer  "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  add_index "authorizations", ["client_id", "area_id", "created_at", "sequence_number"], :name => "index_client_area_created_sequence"
  add_index "authorizations", ["client_id"], :name => "index_authorizations_on_client_id"
  add_index "authorizations", ["provider_id"], :name => "index_authorizations_on_provider_id"
  add_index "authorizations", ["tracking_number"], :name => "index_authorizations_on_tracking_number"

  create_table "behaviors", :force => true do |t|
    t.integer  "assessment_form_sub_section_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "budget_expenses", :force => true do |t|
    t.integer  "budget_id"
    t.integer  "service_id"
    t.integer  "units"
    t.decimal  "net_rate",                              :precision => 12, :scale => 2
    t.decimal  "tax_rate",                              :precision => 12, :scale => 2
    t.decimal  "gross_rate",                            :precision => 12, :scale => 2
    t.decimal  "total",                                 :precision => 12, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",                                    :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded",                                :default => false
  end

  add_index "budget_expenses", ["budget_id"], :name => "index_budget_expenses_on_budget_id"
  add_index "budget_expenses", ["service_id"], :name => "index_budget_expenses_on_service_id"

  create_table "budget_incomes", :force => true do |t|
    t.integer  "budget_id"
    t.integer  "service_id"
    t.integer  "units"
    t.decimal  "net_rate",                              :precision => 12, :scale => 2
    t.decimal  "total",                                 :precision => 12, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",                                    :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded",                                :default => false
  end

  add_index "budget_incomes", ["budget_id"], :name => "index_budget_incomes_on_budget_id"
  add_index "budget_incomes", ["service_id"], :name => "index_budget_incomes_on_service_id"

  create_table "budget_items", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.boolean  "nhtb_only",  :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "budget_purchases", :force => true do |t|
    t.integer  "budget_id"
    t.string   "name"
    t.decimal  "total",                                 :precision => 12, :scale => 2
    t.date     "due_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",                                    :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded",                                :default => false
  end

  add_index "budget_purchases", ["budget_id", "due_on"], :name => "index_budget_purchases_on_budget_id_and_due_on"

  create_table "budgets", :force => true do |t|
    t.integer  "client_id"
    t.integer  "style"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "budgets", ["client_id"], :name => "index_budgets_on_client_id"

  create_table "cache", :force => true do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "call_logs", :force => true do |t|
    t.integer  "user_id"
    t.date     "made_on"
    t.text     "subject"
    t.string   "mode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "client_id"
  end

  create_table "calling_instructions", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "care_levels", :force => true do |t|
    t.string   "abbreviation"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "carecall_exceptions", :force => true do |t|
    t.integer  "exceptable_id"
    t.string   "exceptable_type"
    t.string   "field"
    t.string   "value"
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "carecall_exports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.datetime "export_start_at"
    t.datetime "export_end_at"
    t.decimal  "provider_groups_time",  :precision => 10, :scale => 2
    t.decimal  "providers_time",        :precision => 10, :scale => 2
    t.decimal  "fms_match_time",        :precision => 10, :scale => 2
    t.decimal  "staff_time",            :precision => 10, :scale => 2
    t.decimal  "staff_services_time",   :precision => 10, :scale => 2
    t.decimal  "claims_time",           :precision => 10, :scale => 2
    t.decimal  "missed_visits_time",    :precision => 10, :scale => 2
    t.decimal  "claim_exceptions_time", :precision => 10, :scale => 2
  end

  create_table "carecall_imports", :force => true do |t|
    t.string   "name"
    t.boolean  "finalized"
    t.datetime "start_at"
    t.datetime "end_at"
    t.decimal  "admin_users_time",       :precision => 10, :scale => 2
    t.decimal  "area_user_xref_time",    :precision => 10, :scale => 2
    t.decimal  "case_manager_xref_time", :precision => 10, :scale => 2
    t.decimal  "provider_groups_time",   :precision => 10, :scale => 2
    t.decimal  "formal_supports_time",   :precision => 10, :scale => 2
    t.decimal  "providers_time",         :precision => 10, :scale => 2
    t.decimal  "provider_services_time", :precision => 10, :scale => 2
    t.decimal  "client_time",            :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "caregiver_burdens", :force => true do |t|
    t.integer  "caregiver_id"
    t.integer  "answer_1"
    t.integer  "answer_2"
    t.integer  "answer_3"
    t.integer  "answer_4"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "caregiver_burdens", ["caregiver_id"], :name => "index_caregiver_burdens_on_caregiver_id"

  create_table "caregiver_comments", :force => true do |t|
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "caregiver_functions", :force => true do |t|
    t.string   "name",                                         :null => false
    t.boolean  "triggers_burden_interview", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "caregiver_release_caregivers", :force => true do |t|
    t.integer  "caregiver_release_id"
    t.integer  "caregiver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "caregiver_releases", :force => true do |t|
    t.integer  "client_id"
    t.text     "signature_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "caregiver_releases", ["client_id"], :name => "index_caregiver_releases_on_client_id"

  create_table "caregiver_tasks", :force => true do |t|
    t.integer  "caregiver_id"
    t.integer  "caregiver_function_id"
    t.boolean  "is_primary",                            :default => false
    t.integer  "frequency"
    t.date     "started_on"
    t.date     "ended_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "caregiver_tasks", ["caregiver_function_id"], :name => "index_caregiver_tasks_on_caregiver_function_id"
  add_index "caregiver_tasks", ["caregiver_id"], :name => "index_caregiver_tasks_on_caregiver_id"

  create_table "caregivers", :force => true do |t|
    t.integer  "client_id"
    t.integer  "contact_id"
    t.boolean  "in_home"
    t.date     "started_on"
    t.date     "ended_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "caregivers", ["client_id"], :name => "index_caregivers_on_client_id"
  add_index "caregivers", ["contact_id"], :name => "index_caregivers_on_contact_id"

  create_table "case_load_downloads", :force => true do |t|
    t.string   "file_name"
    t.float    "local_machine_time_skew"
    t.datetime "downloaded_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "downloaded_by"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "case_load_synchronization_id"
  end

  create_table "case_load_synchronization_errors", :force => true do |t|
    t.integer  "case_load_synchronization_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "case_load_synchronizations", :force => true do |t|
    t.float    "tablet_time_skew"
    t.datetime "overall_start_time"
    t.datetime "upload_create_start_time"
    t.datetime "upload_create_end_time"
    t.boolean  "data_found_to_upload"
    t.datetime "upload_push_start_time"
    t.datetime "upload_push_end_time"
    t.datetime "upload_process_start_time"
    t.datetime "upload_process_end_time"
    t.datetime "download_create_start_time"
    t.datetime "download_create_end_time"
    t.datetime "download_pull_start_time"
    t.datetime "download_pull_end_time"
    t.datetime "download_process_start_time"
    t.datetime "download_process_end_time"
    t.datetime "overall_end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.text     "tablet_diag"
  end

  create_table "case_load_upload_details", :force => true do |t|
    t.text     "data",                :limit => 16777215
    t.integer  "case_load_upload_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "client_id"
    t.boolean  "data_changed",                            :default => false
    t.string   "status"
    t.string   "status_description"
  end

  create_table "case_load_upload_rejects", :force => true do |t|
    t.string   "model_name"
    t.text     "data"
    t.integer  "case_load_upload_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "case_load_upload_detail_id"
    t.integer  "reason_type"
    t.integer  "client_id"
  end

  create_table "case_load_uploads", :force => true do |t|
    t.string   "file_name"
    t.float    "local_machine_time_skew"
    t.datetime "uploaded_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "uploaded_by"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "case_load_synchronization_id"
  end

  create_table "case_load_volumes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "area_id"
    t.integer  "total"
    t.integer  "total_re_evals"
    t.integer  "re_evals_due"
    t.integer  "total_qtrly_visits"
    t.integer  "qtrly_visits_due"
    t.integer  "total_init_assessments"
    t.integer  "init_assessments_due"
    t.integer  "total_init_visits"
    t.integer  "init_visits_due"
    t.integer  "total_mnthly_contacts"
    t.integer  "mnthly_contacts_due"
    t.datetime "created_at"
  end

  create_table "case_management_activities", :force => true do |t|
    t.integer  "client_application_id"
    t.date     "date_due"
    t.date     "date_done"
    t.date     "date_documented"
    t.integer  "for_month"
    t.integer  "for_year"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "activity_performed_id"
    t.string   "activity_performed_type"
  end

  add_index "case_management_activities", ["client_application_id", "for_month", "for_year"], :name => "index_case_management_activities_on_app_id_and_month_and_year"

  create_table "claim_exceptions", :force => true do |t|
    t.string   "exception_code"
    t.integer  "claim_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  add_index "claim_exceptions", ["claim_id"], :name => "index_claim_exceptions_on_claim_id"

  create_table "claims", :force => true do |t|
    t.string   "claim_number"
    t.integer  "tracking_number"
    t.datetime "check_in_at"
    t.datetime "check_out_at"
    t.datetime "date_of_service"
    t.datetime "export_date"
    t.string   "claim_status"
    t.string   "status_code"
    t.string   "source_type"
    t.boolean  "processed"
    t.datetime "payment_date"
    t.string   "visit_code"
    t.string   "visit_type"
    t.integer  "sequence_number"
    t.decimal  "auth_units",                 :precision => 6,  :scale => 2
    t.decimal  "actual_units",               :precision => 6,  :scale => 2
    t.decimal  "billable_units",             :precision => 6,  :scale => 2
    t.decimal  "unit_cost",                  :precision => 10, :scale => 2
    t.decimal  "billable_amount",            :precision => 9,  :scale => 2
    t.string   "service_day"
    t.datetime "auth_service_period"
    t.datetime "actual_service_period"
    t.datetime "service_export_date"
    t.string   "pa_number"
    t.integer  "sub_service_id"
    t.integer  "check_in_phone_number_id"
    t.integer  "check_out_phone_number_id"
    t.integer  "case_manager_id"
    t.integer  "area_id"
    t.integer  "client_id"
    t.integer  "actual_provided_service_id"
    t.integer  "auth_provided_service_id"
    t.integer  "service_procedure_id"
    t.integer  "actual_provider_id"
    t.integer  "auth_provider_id"
    t.integer  "staff_id"
    t.integer  "realized_authorization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "actual_service_id"
  end

  add_index "claims", ["actual_provider_id"], :name => "actual_provider_id"
  add_index "claims", ["check_in_at"], :name => "claims_check_in_at"
  add_index "claims", ["claim_number"], :name => "index_claims_on_claim_number"
  add_index "claims", ["client_id", "actual_provider_id", "check_in_at", "actual_service_id", "realized_authorization_id"], :name => "big"
  add_index "claims", ["client_id"], :name => "index_claims_on_client_id"
  add_index "claims", ["realized_authorization_id", "actual_service_id"], :name => "authorization_and_actual_service"
  add_index "claims", ["staff_id"], :name => "index_claims_on_staff_id"

  create_table "client_applications", :force => true do |t|
    t.integer  "assigned_worker_id"
    t.datetime "worker_assigned_on"
    t.datetime "converted_from_nursing_home_on"
    t.integer  "client_id"
    t.integer  "care_level_id"
    t.integer  "nursing_home_conversion"
    t.boolean  "ventilator_dependent"
    t.boolean  "hiv_positive"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "program_id"
    t.integer  "application_state_id"
    t.boolean  "succeeded",                              :default => false
    t.integer  "intake_worker_id"
    t.date     "applied_on"
    t.boolean  "nursing_facility_stay_at_least_90_days"
    t.boolean  "medicaid_sponsorship"
    t.date     "discharged_from_nursing_facility_on"
    t.boolean  "referred_from_ddsn_hasci"
    t.boolean  "consent_form_included"
    t.boolean  "cltc_intake_form_included"
    t.boolean  "transmittal_form_included"
    t.boolean  "referred_from_medicaid_eligibility"
    t.boolean  "current_medicaid_recipient"
    t.boolean  "needs_pc_ii_or_pdn"
    t.integer  "placement_type"
    t.boolean  "new_record_waiting_to_be_uploaded",      :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded",  :default => false
    t.integer  "payment_source",                         :default => 0
    t.string   "waiting_list_state"
    t.datetime "flagged_at"
    t.integer  "statewide_rank"
    t.integer  "local_rank"
    t.integer  "score"
    t.integer  "priority"
    t.text     "scoring_details"
    t.boolean  "hospitalized"
    t.boolean  "in_foster_care"
    t.boolean  "receiving_pdn"
    t.integer  "override_enrollment_criteria_id"
    t.integer  "waiting_list_exemption_id"
  end

  add_index "client_applications", ["application_state_id"], :name => "index_client_applications_on_application_state_id"
  add_index "client_applications", ["client_id", "program_id", "application_state_id"], :name => "idx_client_program_state_ids_index"
  add_index "client_applications", ["client_id", "program_id"], :name => "client_id"
  add_index "client_applications", ["client_id"], :name => "index_client_applications_on_client_id"
  add_index "client_applications", ["program_id"], :name => "index_client_applications_on_program_id"

  create_table "client_medication_comments", :force => true do |t|
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "client_medications", :force => true do |t|
    t.integer  "client_id"
    t.integer  "medication_id"
    t.integer  "frequency_id"
    t.date     "discontinued_on"
    t.boolean  "special_monitoring_required"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "client_searches", :force => true do |t|
    t.integer "client_id"
    t.integer "area_id"
    t.integer "case_worker_id"
    t.integer "client_state_id"
    t.integer "application_state_id"
    t.integer "program_id"
    t.string  "cltc_number"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "name"
    t.string  "medicaid_number"
    t.string  "medicare_number"
    t.string  "social_security_number"
    t.string  "state"
    t.date    "born_on"
  end

  create_table "client_state_change_reasons", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "client_state_changes", :force => true do |t|
    t.integer  "client_id"
    t.integer  "client_state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "client_state_change_reason_id"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "client_state_changes", ["client_id", "created_at"], :name => "index_on_client_and_created_at"
  add_index "client_state_changes", ["client_state_id"], :name => "index_client_state_changes_on_client_state_id"

  create_table "client_states", :force => true do |t|
    t.integer  "cltc_code"
    t.string   "name"
    t.string   "client_state"
    t.string   "program_state"
    t.text     "description"
    t.boolean  "hide"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "clients", :force => true do |t|
    t.integer  "area_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_initial"
    t.string   "social_security_number"
    t.string   "medicare_number"
    t.string   "medicaid_number"
    t.string   "email"
    t.integer  "suffix_id"
    t.integer  "contact_primary_contact"
    t.integer  "marital_status_id"
    t.integer  "race_id"
    t.integer  "gender_id"
    t.integer  "educational_level_id"
    t.date     "born_on"
    t.integer  "location_density_id"
    t.integer  "county_id"
    t.boolean  "touch_tone_phone"
    t.boolean  "toll_free_access"
    t.integer  "language_id"
    t.boolean  "speaks_english"
    t.boolean  "reads_english"
    t.boolean  "writes_english"
    t.string   "other_language"
    t.boolean  "va_benefits"
    t.boolean  "hospice_client"
    t.integer  "emergency_priority_level_id"
    t.boolean  "declined_emergency_notification"
    t.boolean  "financial_eligibility_verified"
    t.string   "prior_authorization_code"
    t.integer  "consented"
    t.integer  "power_of_attorney_on_file"
    t.date     "consented_on"
    t.boolean  "moving_to_sc"
    t.integer  "client_state_change_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "client_state_id"
    t.boolean  "aps_current_client"
    t.boolean  "at_risk_for_missed_pca_visits"
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "clients", ["client_state_id"], :name => "index_clients_on_client_state_id"
  add_index "clients", ["medicaid_number"], :name => "index_clients_on_medicaid_number"
  add_index "clients", ["medicare_number"], :name => "index_clients_on_medicare_number"

  create_table "comments", :force => true do |t|
    t.text     "text"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.string   "tag",                                   :limit => 128
    t.boolean  "new_record_waiting_to_be_uploaded",                    :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded",                :default => false
  end

  add_index "comments", ["commentable_type", "commentable_id"], :name => "index_comments_on_commentable_type_and_commentable_id"
  add_index "comments", ["tag"], :name => "index_comments_on_tag"

  create_table "complaints", :force => true do |t|
    t.integer  "program_id"
    t.integer  "client_id"
    t.integer  "provider_id"
    t.integer  "owner_id"
    t.integer  "worker_id"
    t.integer  "resolver_id"
    t.string   "state"
    t.string   "complainant_name"
    t.integer  "complainant_id"
    t.string   "provider_number"
    t.string   "reason_name"
    t.string   "referred_to"
    t.integer  "complainant_type_id"
    t.integer  "complainant_relationship_id"
    t.integer  "reason_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.date     "resolved_on"
    t.date     "occurred_on"
    t.integer  "case_manager_id"
    t.string   "service_ids"
    t.string   "service_delivery_problem_ids"
    t.string   "contract_problem_ids"
    t.date     "billed_on"
    t.date     "documented_on"
    t.date     "due_on"
    t.date     "completed_on"
    t.date     "started_on"
    t.date     "ended_on"
  end

  create_table "conditions", :force => true do |t|
    t.integer  "assessment_form_sub_section_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "consents", :force => true do |t|
    t.integer  "client_id"
    t.text     "signature"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "contacts", :force => true do |t|
    t.integer  "client_id"
    t.integer  "relationship_id"
    t.boolean  "primary",                               :default => false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "lives_with"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "contacts", ["client_id"], :name => "index_contacts_on_client_id"

  create_table "counties", :force => true do |t|
    t.string   "name"
    t.integer  "area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  add_index "counties", ["area_id"], :name => "index_counties_on_area_id"

  create_table "custom_interventions", :force => true do |t|
    t.integer  "realized_discipline_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "custom_problem_goal_intervention_actors", :force => true do |t|
    t.integer  "custom_problem_goal_intervention_id"
    t.integer  "actor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "custom_problem_goal_intervention_actors", ["custom_problem_goal_intervention_id"], :name => "custprobgoalintervact_idx_interv"

  create_table "custom_problem_goal_interventions", :force => true do |t|
    t.integer  "realized_discipline_id"
    t.string   "problem"
    t.string   "goal"
    t.string   "intervention"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "custom_problem_goal_interventions", ["realized_discipline_id"], :name => "custprobgoalinterv_idx_disc"

  create_table "custom_problems", :force => true do |t|
    t.integer  "realized_discipline_id"
    t.string   "description"
    t.string   "goal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "dashboard_notifications", :force => true do |t|
    t.string   "notifiable_type"
    t.integer  "notifiable_id"
    t.string   "type"
    t.integer  "notifiee_id"
    t.datetime "created_at"
    t.datetime "notified_at"
    t.string   "msg"
    t.string   "lnk"
  end

  add_index "dashboard_notifications", ["notifiable_id", "notifiable_type"], :name => "dash_notif_notifiable_poly"
  add_index "dashboard_notifications", ["notifiee_id"], :name => "index_dashboard_notifications_on_notifiee_id"

  create_table "days", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "order"
  end

  add_index "days", ["order"], :name => "index_days_on_order"

  create_table "db_files", :force => true do |t|
    t.binary "data", :limit => 2147483647
  end

  create_table "ddsn_clients", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "provider_id"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "ddsn_exports", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.string   "name"
    t.decimal  "provider_time",         :precision => 10, :scale => 2
    t.decimal  "provided_service_time", :precision => 10, :scale => 2
    t.decimal  "service_time",          :precision => 10, :scale => 2
    t.datetime "start_at"
    t.datetime "end_at"
    t.decimal  "county_time",           :precision => 10, :scale => 2
  end

  create_table "ddsn_staff", :force => true do |t|
    t.string   "name"
    t.boolean  "nurse_supervisor"
    t.integer  "review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "provider_id"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "diagnoses", :force => true do |t|
    t.integer  "diagnosis_category_id"
    t.string   "name"
    t.string   "icd9"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.datetime "inactive_at"
    t.integer  "inactive_by"
    t.string   "nickname"
  end

  create_table "diagnosis_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "directed_attendant_care_request_custom_fields", :force => true do |t|
    t.integer  "directed_attendant_care_request_id"
    t.integer  "program_id"
    t.integer  "attendant_relationship_to_participant_id"
    t.integer  "representative_relationship_to_participant_id"
    t.boolean  "new_record_waiting_to_be_uploaded",                          :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded",                      :default => false
    t.boolean  "pay_rate_negotiable"
    t.boolean  "companion_only"
    t.boolean  "chore_only"
    t.boolean  "director_aware_eor"
    t.boolean  "director_accepts_eor_responsibilities"
    t.integer  "participant_communicates_clearly"
    t.integer  "participant_follows_directions"
    t.integer  "participant_short_term_memory_problems"
    t.integer  "participant_makes_own_health_care_decisions"
    t.integer  "participant_has_mental_health_issues"
    t.boolean  "participant_knows_medical_condition"
    t.boolean  "participant_can_be_trained"
    t.boolean  "director_knows_attendant"
    t.boolean  "participant_has_legal_guardian"
    t.boolean  "attendant_related_to_participant"
    t.boolean  "attendant_lives_with_participant"
    t.boolean  "parties_understand_payment_process"
    t.boolean  "representative_related_to_participant"
    t.boolean  "representative_lives_with_participant"
    t.boolean  "representative_understands_cannot_be_paid"
    t.boolean  "representative_accessible"
    t.boolean  "representative_reliable"
    t.boolean  "participant_agrees_to_representative_supervising"
    t.boolean  "representative_agrees_to_supervise"
    t.boolean  "can_representative_advocate"
    t.boolean  "can_representative_communicate"
    t.boolean  "representative_knows_medical_condition"
    t.boolean  "representative_provides_direct_care"
    t.text     "participant_not_trainable_explanation"
    t.float    "anticipated_attendant_care_hours"
    t.float    "anticipated_companion_services_hours"
    t.string   "attendant_name"
    t.string   "attendant_phone"
    t.string   "attendant_address"
    t.string   "attendant_contact_time"
    t.string   "legal_guardian_name"
    t.string   "representative_name"
    t.string   "representative_phone"
    t.string   "representative_address"
    t.string   "director"
    t.text     "reason_participant_disagrees_to_representative_supervising"
    t.string   "representative_direct_care_duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "uap_nurse_id"
    t.boolean  "backup_plan_sent"
    t.date     "match_visit_on"
    t.boolean  "uap_nurse_directed_attendant_to_schedule_billing_training"
    t.boolean  "service_authorizable_after_attendant_billing_training"
    t.boolean  "service_authorizable_after_start_date_coordination"
    t.integer  "services_requested"
  end

  create_table "disciplines", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "drug_interactions", :force => true do |t|
    t.string  "description"
    t.integer "severity_level"
  end

  create_table "dwellings", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "edits", :force => true do |t|
    t.integer  "editable_id"
    t.string   "editable_type"
    t.string   "field"
    t.string   "old_value"
    t.string   "new_value"
    t.integer  "created_by"
    t.integer  "deleted_by"
    t.datetime "created_at"
    t.datetime "deleted_at"
  end

  add_index "edits", ["editable_id", "editable_type"], :name => "index_edits_on_editable_id_and_editable_type"

  create_table "educational_levels", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "eligibility_categories", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "email_addresses", :force => true do |t|
    t.string   "email_address"
    t.integer  "emailable_id"
    t.string   "emailable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "email_addresses", ["emailable_id"], :name => "index_email_addresses_on_emailable_id"
  add_index "email_addresses", ["emailable_type"], :name => "index_email_addresses_on_emailable_type"

  create_table "emergency_disaster_priorities", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "example"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "emergency_priority_levels", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "end_user_reports", :force => true do |t|
    t.string   "report_class_name"
    t.string   "view_partial"
    t.boolean  "requires_user_input"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.string   "name"
    t.text     "description"
    t.string   "section"
    t.string   "output_file_name"
    t.string   "form_partial"
    t.string   "report_mixin"
    t.boolean  "summary",             :default => false
    t.string   "filter_mixin"
    t.boolean  "active",              :default => false
  end

  create_table "enhancement_votes", :force => true do |t|
    t.integer  "enhancement_id"
    t.integer  "direction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "enhancements", :force => true do |t|
    t.integer  "owner_id"
    t.string   "category"
    t.string   "state"
    t.datetime "occurred_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.string   "priority"
  end

  create_table "env_mod_actions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "env_mod_needs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "env_mod_project_actions", :force => true do |t|
    t.integer  "env_mod_project_id"
    t.integer  "env_mod_action_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "env_mod_project_actions", ["created_by"], :name => "index_env_mod_actions_on_created_by"
  add_index "env_mod_project_actions", ["env_mod_action_id"], :name => "index_env_mod_project_actions_on_env_mod_action_id"
  add_index "env_mod_project_actions", ["env_mod_project_id"], :name => "index_env_mod_actions_on_env_mod_project_id"

  create_table "env_mod_project_bids", :force => true do |t|
    t.integer  "env_mod_project_id"
    t.decimal  "price",                                 :precision => 12, :scale => 2
    t.text     "description"
    t.boolean  "winner",                                                               :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",                                    :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded",                                :default => false
  end

  add_index "env_mod_project_bids", ["created_by"], :name => "index_env_mod_bids_on_created_by"
  add_index "env_mod_project_bids", ["env_mod_project_id"], :name => "index_env_mod_bids_on_env_mod_project_id"

  create_table "env_mod_project_needs", :force => true do |t|
    t.integer  "env_mod_project_id"
    t.integer  "env_mod_need_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "env_mod_project_needs", ["env_mod_need_id"], :name => "index_env_mod_needs_on_env_mod_need_item_id"
  add_index "env_mod_project_needs", ["env_mod_project_id"], :name => "index_env_mod_needs_on_env_mod_project_id"

  create_table "env_mod_project_pictures", :force => true do |t|
    t.integer  "env_mod_project_id"
    t.string   "name"
    t.integer  "size"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "height"
    t.integer  "width"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.integer  "db_file_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "env_mod_project_pictures", ["env_mod_project_id"], :name => "index_env_mod_pictures_on_env_mod_project_id"
  add_index "env_mod_project_pictures", ["parent_id"], :name => "index_env_mod_pictures_on_parent_id"

  create_table "env_mod_projects", :force => true do |t|
    t.integer  "home_assessment_id"
    t.string   "state"
    t.text     "description"
    t.datetime "closed_at"
    t.date     "to_be_completed_on"
    t.integer  "winning_bid_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.datetime "completed_at"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "env_mod_projects", ["created_by"], :name => "index_env_mod_projects_on_created_by"
  add_index "env_mod_projects", ["home_assessment_id"], :name => "index_env_mod_projects_on_home_assessment_id"
  add_index "env_mod_projects", ["winning_bid_id"], :name => "index_env_mod_projects_on_winning_bid_id"

  create_table "events", :force => true do |t|
    t.integer  "actor_id"
    t.string   "actor_type"
    t.integer  "object_id"
    t.string   "object_type"
    t.string   "event_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "object_parent_id"
    t.string   "object_parent_type"
  end

  add_index "events", ["actor_id", "actor_type"], :name => "index_events_on_actor_id_and_actor_type"
  add_index "events", ["created_at"], :name => "index_events_on_created_at"
  add_index "events", ["event_type"], :name => "index_events_on_event_type"
  add_index "events", ["object_id", "object_type"], :name => "index_events_on_object_id_and_object_type"
  add_index "events", ["object_parent_id", "object_parent_type"], :name => "index_events_on_object_parent_id_and_object_parent_type"

  create_table "expenditures", :force => true do |t|
    t.integer  "service_id"
    t.integer  "program_id"
    t.decimal  "amount",     :precision => 12, :scale => 2
    t.string   "week"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "area_id"
    t.integer  "enrolled"
  end

  create_table "fields", :force => true do |t|
    t.integer  "report_id"
    t.boolean  "filterable"
    t.boolean  "displayable"
    t.boolean  "groupable"
    t.string   "table_name"
    t.string   "column_name"
    t.string   "modifier"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "forms", :force => true do |t|
    t.string "name"
    t.string "abbreviation"
  end

  create_table "frequencies", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "daily_or_more"
    t.decimal  "days_per_week", :precision => 4, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.datetime "inactive_at"
    t.integer  "inactive_by"
    t.string   "nickname"
  end

  create_table "genders", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "hiv_care_level_exception_custom_fields", :force => true do |t|
    t.integer  "hiv_care_level_exception_id"
    t.text     "service_needs"
    t.text     "resources_in_place"
    t.text     "rationale"
    t.boolean  "prior_exception"
    t.date     "prior_exception_made_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "hiv_diagnoses", :force => true do |t|
    t.string   "name"
    t.string   "icd9"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "holidays", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "sort_order"
  end

  add_index "holidays", ["sort_order"], :name => "index_holidays_on_sort_order"

  create_table "home_assessment_comments", :force => true do |t|
    t.integer  "home_assessment_id"
    t.integer  "home_assessment_form_section_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "home_assessment_comments", ["home_assessment_id", "home_assessment_form_section_id"], :name => "index_home_assessment_comments_on_fks"

  create_table "home_assessment_form_sections", :force => true do |t|
    t.string   "name"
    t.string   "partial_name"
    t.integer  "position"
    t.boolean  "commentable",  :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  add_index "home_assessment_form_sections", ["position"], :name => "index_home_assessment_form_sections_on_position"

  create_table "home_assessment_home_conditions", :force => true do |t|
    t.integer  "home_assessment_id"
    t.integer  "home_condition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "home_assessment_home_conditions", ["home_assessment_id"], :name => "hahc_home_assessment_id"

  create_table "home_assessment_home_environments", :force => true do |t|
    t.integer  "home_assessment_id"
    t.integer  "home_environment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "home_assessment_home_needs", :force => true do |t|
    t.integer  "home_assessment_id"
    t.integer  "home_need_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "status",                                :default => 0
    t.datetime "met_at"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "home_assessment_home_needs", ["home_assessment_id"], :name => "index_home_needs_on_home_assessment_id"
  add_index "home_assessment_home_needs", ["home_need_id"], :name => "index_home_needs_on_home_need_item_id"

  create_table "home_assessment_sections", :force => true do |t|
    t.integer  "home_assessment_id"
    t.integer  "home_assessment_form_section_id"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "home_assessment_sections", ["home_assessment_form_section_id"], :name => "index_home_assessment_sections_on_form_section"
  add_index "home_assessment_sections", ["home_assessment_id"], :name => "index_home_assessment_sections_on_home_assessment_id"

  create_table "home_assessments", :force => true do |t|
    t.integer  "client_id"
    t.integer  "address_id"
    t.integer  "household_size"
    t.integer  "dwelling_id"
    t.integer  "living_arrangement_id"
    t.integer  "ownership_id"
    t.datetime "completed_at"
    t.integer  "door_to_enter"
    t.integer  "num_dogs"
    t.integer  "num_cats"
    t.integer  "num_birds"
    t.integer  "num_reptiles"
    t.integer  "num_other_animals"
    t.boolean  "dangerous_animals",                     :default => false
    t.boolean  "ramp_needed",                           :default => false
    t.integer  "ramp_client_movement"
    t.integer  "ramp_client_weight"
    t.integer  "ramp_wheelchair_size"
    t.text     "ramp_accessible_doors"
    t.integer  "ramp_ground_door"
    t.integer  "ramp_preferred_door"
    t.integer  "ramp_landing_height"
    t.integer  "ramp_landing_steps"
    t.integer  "ramp_threshold_height"
    t.boolean  "ramp_referred_to_emod",                 :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "emergency_disaster_priority_id"
    t.integer  "ramp_completion_form_id"
    t.datetime "ramp_completed_at"
    t.datetime "ramp_authorization_created_at"
    t.boolean  "ramp_sent_to_provider",                 :default => false
    t.text     "ramp_provider_notes"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
    t.integer  "emergency_management_notified_id"
  end

  add_index "home_assessments", ["dwelling_id"], :name => "index_home_assessments_on_dwelling_id"
  add_index "home_assessments", ["living_arrangement_id"], :name => "index_home_assessments_on_living_arrangement_id"
  add_index "home_assessments", ["ownership_id"], :name => "index_home_assessments_on_ownership_id"

  create_table "home_conditions", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "home_environments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "home_needs", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "information_sources", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "insurances", :force => true do |t|
    t.integer  "client_id"
    t.string   "name"
    t.string   "number"
    t.integer  "insurance_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "insurances", ["client_id"], :name => "index_insurances_on_client_id"

  create_table "intervention_actors", :force => true do |t|
    t.integer  "intervention_id"
    t.integer  "actor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "intervention_service_mappings", :force => true do |t|
    t.integer  "intervention_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "service_group_id"
  end

  create_table "interventions", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "issues", :force => true do |t|
    t.string   "category"
    t.string   "state"
    t.integer  "client_id"
    t.datetime "occurred_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "owner_id"
    t.integer  "resolution_time"
    t.string   "mode"
    t.string   "resolution_category"
  end

  create_table "jobs", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "service_id"
  end

  add_index "jobs", ["service_id"], :name => "index_jobs_on_service_id"

  create_table "joins", :force => true do |t|
    t.integer  "report_id"
    t.boolean  "root"
    t.string   "primary_table_name"
    t.string   "primary_key"
    t.string   "foreign_table_name"
    t.string   "foreign_key"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "languages", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "levels_of_care", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "local_provided_services", :force => true do |t|
    t.integer  "local_provider_id"
    t.integer  "service_id"
    t.integer  "county_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "local_providers", :force => true do |t|
    t.integer  "provider_id"
    t.integer  "area_id"
    t.integer  "county_id"
    t.string   "name"
    t.string   "state"
    t.datetime "enrolled_on"
    t.datetime "terminated_on"
    t.string   "contact_name"
    t.time     "office_hours_opening"
    t.time     "office_hours_closing"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "location_densities", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "location_groups", :force => true do |t|
    t.string   "phoneable_type"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "locations", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "login_attempts", :force => true do |t|
    t.string   "login"
    t.integer  "user_id"
    t.boolean  "success"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  add_index "login_attempts", ["success"], :name => "index_login_attempts_on_success"
  add_index "login_attempts", ["user_id", "success"], :name => "index_login_attempts_on_user_id_and_success"
  add_index "login_attempts", ["user_id"], :name => "index_login_attempts_on_user_id"

  create_table "marital_statuses", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "meal_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "medicaid_eligibilities", :force => true do |t|
    t.integer  "client_id"
    t.string   "payment_category"
    t.date     "starts_on"
    t.date     "ends_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "medicaid_offices", :force => true do |t|
    t.integer  "county_id"
    t.string   "name"
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "medicaid_rsps", :force => true do |t|
    t.integer  "client_id"
    t.string   "code"
    t.date     "starts_on"
    t.date     "ends_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "medication_drug_interactions", :force => true do |t|
    t.integer "medication_route_id"
    t.integer "drug_interaction_id"
  end

  create_table "medication_forms", :force => true do |t|
    t.integer "medication_name_id"
    t.integer "medication_route_id"
    t.integer "route_id"
    t.integer "form_id"
  end

  add_index "medication_forms", ["medication_route_id"], :name => "index_medication_forms_on_medication_route_id"

  create_table "medication_images", :force => true do |t|
    t.integer "medication_id"
    t.string  "ndc"
    t.string  "filename"
  end

  create_table "medication_names", :force => true do |t|
    t.string  "name"
    t.boolean "generic"
  end

  create_table "medication_routes", :force => true do |t|
    t.integer "medication_name_id"
    t.integer "route_id"
  end

  add_index "medication_routes", ["medication_name_id"], :name => "index_medication_routes_on_medication_name_id"

  create_table "medication_therapeutic_classes", :force => true do |t|
    t.integer "medication_id"
    t.integer "therapeutic_class_id"
  end

  add_index "medication_therapeutic_classes", ["medication_id"], :name => "idx_mtc_medication_id"

  create_table "medications", :force => true do |t|
    t.integer "medication_name_id"
    t.integer "route_id"
    t.integer "form_id"
    t.string  "full_name"
    t.string  "ndc"
    t.decimal "strength",           :precision => 10, :scale => 6
    t.string  "unit_of_measure"
    t.boolean "over_the_counter"
    t.integer "status"
  end

  add_index "medications", ["route_id", "form_id", "medication_name_id", "status"], :name => "lookup_index"

  create_table "meta_providers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.string   "nickname"
    t.datetime "inactive_at"
    t.integer  "inactive_by"
  end

  add_index "meta_providers", ["inactive_at"], :name => "index_meta_providers_on_inactive_at"

  create_table "missed_visits", :force => true do |t|
    t.integer  "area_id"
    t.integer  "client_id"
    t.integer  "provider_id"
    t.integer  "service_id"
    t.integer  "auth_units"
    t.string   "missed_visit_code"
    t.string   "service_day"
    t.string   "visit_type"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "date_of_service"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  add_index "missed_visits", ["client_id"], :name => "index_missed_visits_on_client_id"
  add_index "missed_visits", ["provider_id", "area_id", "client_id", "date_of_service"], :name => "index_provider_area_client_date_of_service"
  add_index "missed_visits", ["provider_id"], :name => "index_missed_visits_on_provider_id"

  create_table "narrative_answers", :force => true do |t|
    t.text     "choice_text"
    t.boolean  "choice_boolean"
    t.datetime "choice_date"
    t.text     "choice_options"
    t.string   "choice_selected_option"
    t.integer  "narrative_question_id"
    t.integer  "narrative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "narrative_answers", ["narrative_id", "narrative_question_id"], :name => "narrative_answer_narr_quest_index"
  add_index "narrative_answers", ["narrative_id"], :name => "index_narrative_answers_on_narrative_id"
  add_index "narrative_answers", ["narrative_question_id"], :name => "index_narrative_answers_on_narrative_question_id"

  create_table "narrative_question_types", :force => true do |t|
    t.integer  "narrative_question_id"
    t.integer  "narrative_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "narrative_questions", :force => true do |t|
    t.integer  "position"
    t.text     "question"
    t.string   "choice_type"
    t.text     "choice_options"
    t.integer  "narrative_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.text     "comments"
    t.string   "condition"
    t.string   "ask_if"
    t.integer  "parent_id"
    t.datetime "inactive_at"
    t.integer  "inactive_by"
  end

  create_table "narrative_searches", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "narrative_type_programs", :force => true do |t|
    t.integer  "narrative_type_id"
    t.integer  "program_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "application_state_id"
  end

  create_table "narrative_types", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.string   "nickname"
  end

  create_table "narratives", :force => true do |t|
    t.text     "comment",                               :limit => 2147483647
    t.integer  "cltc_code"
    t.integer  "client_id"
    t.integer  "area_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "narrative_type_id"
    t.datetime "completed_at"
    t.datetime "contacted_at"
    t.boolean  "new_record_waiting_to_be_uploaded",                           :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded",                       :default => false
  end

  add_index "narratives", ["area_id"], :name => "index_narratives_on_area_id"
  add_index "narratives", ["client_id"], :name => "index_narratives_on_client_id"
  add_index "narratives", ["completed_at"], :name => "index_narratives_on_completed_at"
  add_index "narratives", ["deleted_at"], :name => "index_narratives_on_deleted_at"
  add_index "narratives", ["user_id"], :name => "index_narratives_on_user_id"

  create_table "nursing_home_facilities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "other_supports", :force => true do |t|
    t.integer  "client_id"
    t.integer  "local_provider_id"
    t.integer  "service_id"
    t.string   "status",                                :default => "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
    t.integer  "realized_authorization_id"
  end

  add_index "other_supports", ["client_id"], :name => "index_other_supports_on_client_id"
  add_index "other_supports", ["local_provider_id"], :name => "index_other_supports_on_provider_id"
  add_index "other_supports", ["service_id"], :name => "index_other_supports_on_service_id"
  add_index "other_supports", ["status"], :name => "index_other_supports_on_status"

  create_table "ownerships", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "participant_fund_request_custom_fields", :force => true do |t|
    t.integer  "participant_fund_request_id"
    t.string   "service_requested"
    t.text     "justification"
    t.float    "amount_requested"
    t.boolean  "prior_payment"
    t.date     "prior_payment_made_on"
    t.float    "prior_payment_amount"
    t.string   "check_number"
    t.float    "amount_paid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
    t.text     "other_resources_sought"
    t.string   "company_name"
    t.string   "company_address_line_1"
    t.string   "company_address_line_2"
    t.string   "company_city"
    t.integer  "company_state_id"
    t.string   "company_zipcode"
    t.string   "account_name"
    t.string   "account_number"
  end

  create_table "pasarr_hospitalizations", :force => true do |t|
    t.integer  "pasarr_id"
    t.date     "started_on"
    t.date     "ended_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "pasarr_hospitalizations", ["pasarr_id"], :name => "index_pasarr_hospitalizations_on_pasarr_id"

  create_table "pasarr_level2_mental_illnesses", :force => true do |t|
    t.integer  "pasarr_id"
    t.text     "appearance"
    t.text     "ability_to_communicate"
    t.text     "mental_status"
    t.text     "observed_behavior"
    t.text     "current_living_situation"
    t.text     "significant_family_history"
    t.text     "social_personal_and_support_systems"
    t.text     "maladaptive_inappropriate_behavior"
    t.text     "past_mental_health_history"
    t.text     "medical_history"
    t.text     "present_treatment"
    t.text     "summary_comments"
    t.text     "mi_assessor_signature_data"
    t.boolean  "determined"
    t.boolean  "requires_services"
    t.integer  "recommendation_id"
    t.date     "recommendation_received_on"
    t.date     "notification_sent_on"
    t.date     "mi_assessor_signed_on"
    t.string   "notification_ids"
    t.string   "recommendation_received_from"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "pasarr_level2_mental_retardations", :force => true do |t|
    t.integer  "pasarr_id"
    t.text     "appearance"
    t.text     "ability_to_communicate"
    t.text     "mental_status"
    t.text     "observed_behavior"
    t.text     "birth_and_early_development_history"
    t.text     "social_development"
    t.text     "social_personal_significant_family_history"
    t.text     "independent_living_development_ability"
    t.text     "maladaptive_inappropriate_behavior"
    t.text     "medical_history"
    t.text     "impact_of_medical_problems"
    t.text     "community_social_supports"
    t.text     "summary_comments"
    t.text     "mr_assessor_signature_data"
    t.boolean  "determined"
    t.boolean  "requires_services"
    t.integer  "recommendation_id"
    t.string   "notification_ids"
    t.date     "recommendation_received_on"
    t.date     "notification_sent_on"
    t.date     "mr_assessor_signed_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",          :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded",      :default => false
  end

  create_table "pasarrs", :force => true do |t|
    t.integer  "client_id"
    t.boolean  "cared_for_others"
    t.boolean  "concept_formation"
    t.boolean  "diagnosis_of_dementia"
    t.boolean  "diagnosis_of_mi"
    t.boolean  "diagnosis_of_mr"
    t.boolean  "drivers_license"
    t.boolean  "gainfully_employed"
    t.boolean  "gradeschool_education"
    t.boolean  "mini_mental_completed"
    t.boolean  "performed_household_duties"
    t.boolean  "performed_self_care"
    t.boolean  "remembers_meal"
    t.boolean  "simple_math"
    t.integer  "location_id"
    t.integer  "review_type_id"
    t.integer  "recommendation_id"
    t.integer  "completer_id"
    t.integer  "mini_mental_score"
    t.integer  "low_iq_id"
    t.integer  "iq_tested_young_id"
    t.string   "admitting_nursing_facility"
    t.string   "assessor_name"
    t.string   "source_of_information"
    t.string   "location_name"
    t.string   "indicator_ids"
    t.string   "mi_diagnosis_ids"
    t.string   "recipient_ids"
    t.string   "acd_ids"
    t.text     "psychiatric_hospitalization"
    t.text     "recommendation_reviewer_signature_data"
    t.text     "recommendation_assessor_signature_data"
    t.text     "acd_reviewer_signature_data"
    t.text     "acd_assessor_signature_data"
    t.date     "recommendation_sent_on"
    t.date     "sent_to_nursing_facility_on"
    t.date     "screened_on"
    t.date     "admitted_on"
    t.date     "recommendation_reviewer_signed_on"
    t.date     "recommendation_assessor_signed_on"
    t.date     "acd_reviewer_signed_on"
    t.date     "acd_assessor_signed_on"
    t.datetime "completed_at"
    t.datetime "reviewed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",      :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded",  :default => false
  end

  add_index "pasarrs", ["client_id"], :name => "index_pasarrs_on_client_id"

  create_table "pc2_survey_candidates", :force => true do |t|
    t.integer  "client_id"
    t.integer  "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "pc_case_load_downloads", :force => true do |t|
    t.string   "file_name"
    t.float    "local_machine_time_skew"
    t.datetime "downloaded_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "downloaded_by"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "pc_case_load_upload_details", :force => true do |t|
    t.boolean  "data_changed"
    t.integer  "review_id"
    t.text     "data"
    t.integer  "pc_case_load_upload_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.string   "status"
    t.string   "status_description"
  end

  create_table "pc_case_load_upload_rejects", :force => true do |t|
    t.integer  "review_id"
    t.string   "model_name"
    t.text     "data"
    t.integer  "pc_case_load_upload_id"
    t.integer  "pc_case_load_upload_detail_id"
    t.integer  "reason_type",                   :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "pc_case_load_uploads", :force => true do |t|
    t.string   "file_name"
    t.float    "local_machine_time_skew"
    t.datetime "uploaded_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "uploaded_by"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "pdf_forms", :force => true do |t|
    t.integer  "client_id"
    t.text     "params",                                :limit => 16777215
    t.string   "type"
    t.binary   "pdf",                                   :limit => 2147483647
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",                           :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded",                       :default => false
  end

  add_index "pdf_forms", ["client_id"], :name => "pdf_forms_client_id"

  create_table "personal_representatives", :force => true do |t|
    t.integer  "client_id"
    t.string   "name"
    t.integer  "relationship_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "phone_numbers", :force => true do |t|
    t.integer  "location_id"
    t.string   "other_location"
    t.string   "area_code"
    t.string   "number"
    t.string   "extension"
    t.boolean  "primary"
    t.integer  "phoneable_id"
    t.string   "phoneable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "calling_instruction_id"
    t.boolean  "flagged_for_carecall"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "phone_numbers", ["area_code", "number"], :name => "index_area_code_number"
  add_index "phone_numbers", ["phoneable_id"], :name => "index_phone_numbers_on_phoneable_id"
  add_index "phone_numbers", ["phoneable_type"], :name => "index_phone_numbers_on_phoneable_type"

  create_table "physicians", :force => true do |t|
    t.integer  "client_id"
    t.string   "name"
    t.string   "office_contact"
    t.integer  "speciality_id"
    t.string   "other_speciality"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "physicians", ["client_id"], :name => "index_physicians_on_client_id"

  create_table "poly_holidays", :force => true do |t|
    t.integer  "holiday_id"
    t.integer  "holidayable_id"
    t.string   "holidayable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "previous_areas", :force => true do |t|
    t.integer  "client_id"
    t.integer  "area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "problem_interventions", :force => true do |t|
    t.integer  "problem_id"
    t.integer  "intervention_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.string   "condition"
  end

  create_table "problems", :force => true do |t|
    t.integer  "discipline_id"
    t.string   "description"
    t.string   "goal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "program_assessment_form_sub_sections", :force => true do |t|
    t.integer "program_id"
    t.integer "assessment_form_sub_section_id"
    t.boolean "phone_assessment"
  end

  create_table "program_care_levels", :force => true do |t|
    t.integer  "program_id"
    t.integer  "care_level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "program_state_changes", :force => true do |t|
    t.integer  "cltc_code"
    t.string   "name"
    t.string   "program_state"
    t.text     "description"
    t.boolean  "hide"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "program_statuses", :force => true do |t|
    t.integer  "program_id"
    t.integer  "client_application_id"
    t.integer  "program_state_change_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "program_turnovers", :force => true do |t|
    t.integer  "number_in"
    t.integer  "number_out"
    t.integer  "program_id"
    t.string   "for_day"
    t.string   "for_month"
    t.string   "for_year"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "number_apps_in"
    t.integer  "number_apps_out"
    t.integer  "initial_census"
  end

  add_index "program_turnovers", ["for_month", "for_year"], :name => "index_program_turnovers_on_for_month_and_for_year"
  add_index "program_turnovers", ["program_id"], :name => "index_program_turnovers_on_program_id"

  create_table "programs", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "sort_order"
    t.boolean  "assessed"
    t.boolean  "phone_assessed"
    t.boolean  "recommend_care_level"
    t.boolean  "internal"
    t.boolean  "wait_listed",          :default => false
    t.boolean  "flagged_for_carecall"
    t.integer  "flag_up_to"
    t.string   "nickname"
    t.string   "evaluator_name"
    t.string   "name_abbreviation"
  end

  add_index "programs", ["flagged_for_carecall"], :name => "flagged_for_carecall"

  create_table "proposed_providers", :force => true do |t|
    t.integer  "authorization_referral_id"
    t.integer  "provider_id"
    t.integer  "priority"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.string   "status"
    t.datetime "notified_at"
    t.text     "cltc_decline_reason"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "provided_services", :force => true do |t|
    t.string   "state"
    t.integer  "service_area_id"
    t.integer  "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "service_id"
  end

  add_index "provided_services", ["provider_id"], :name => "index_provided_services_on_provider_id"
  add_index "provided_services", ["service_area_id"], :name => "index_provided_services_on_service_area_id"
  add_index "provided_services", ["service_id"], :name => "index_provided_services_on_service_id"
  add_index "provided_services", ["state", "service_id"], :name => "index_provided_services_on_state_and_service_id"

  create_table "provider_groups", :force => true do |t|
    t.string   "cltc_code"
    t.string   "name"
    t.string   "npi"
    t.string   "taxonomy"
    t.string   "password"
    t.string   "fein"
    t.datetime "start_at"
    t.datetime "terminate_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.string   "state"
    t.boolean  "send_to_carecall", :default => false
  end

  add_index "provider_groups", ["cltc_code"], :name => "index_provider_groups_on_cltc_code"

  create_table "provider_local_informations", :force => true do |t|
    t.datetime "carecall_training_at"
    t.integer  "trainer_id"
    t.string   "contact_name"
    t.integer  "area_id"
    t.integer  "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.string   "carecall_trainer"
  end

  add_index "provider_local_informations", ["provider_id"], :name => "index_local_providers_on_provider_id"

  create_table "provider_meal_types", :force => true do |t|
    t.integer  "provider_id"
    t.integer  "meal_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "provider_searches", :force => true do |t|
    t.string   "provider_number"
    t.string   "name"
    t.string   "county"
    t.string   "city"
    t.string   "state"
    t.boolean  "provider_reviewed"
    t.integer  "provider_group_id"
    t.integer  "area_id"
    t.datetime "review_range_start"
    t.datetime "review_range_end"
    t.boolean  "provider_waivered"
  end

  create_table "provider_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "providers", :force => true do |t|
    t.string   "waivered_provider_number"
    t.string   "non_waivered_provider_number"
    t.string   "name"
    t.string   "state"
    t.string   "fid"
    t.string   "pin"
    t.string   "taxonomy"
    t.string   "npi"
    t.string   "password"
    t.string   "contact_name"
    t.string   "administrator_name"
    t.integer  "entity_qualifier"
    t.boolean  "waiver",                        :default => false
    t.boolean  "new_provider",                  :default => false
    t.boolean  "web_entry_field",               :default => false
    t.boolean  "reviewed",                      :default => false
    t.boolean  "locked",                        :default => false
    t.integer  "locked_by"
    t.integer  "area_id"
    t.integer  "county_id"
    t.integer  "provider_group_id"
    t.datetime "next_review_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.datetime "locked_at"
    t.datetime "review_range_start"
    t.datetime "review_range_end"
    t.datetime "last_review_date"
    t.float    "last_review_score"
    t.integer  "last_review_outcome_id"
    t.time     "office_hours_opening"
    t.time     "office_hours_closing"
    t.string   "verification_token"
    t.datetime "verified_at"
    t.integer  "parent_waivered_provider_id"
    t.date     "enrolled_on"
    t.date     "terminated_on"
    t.boolean  "authorization_prevention_flag", :default => false
    t.boolean  "notify_first_authorization",    :default => false
  end

  add_index "providers", ["authorization_prevention_flag"], :name => "index_providers_on_flagged_for_carecall_override"
  add_index "providers", ["non_waivered_provider_number"], :name => "index_providers_on_non_waivered_provider_number"
  add_index "providers", ["waivered_provider_number"], :name => "index_providers_on_waivered_provider_number"

  create_table "qas", :force => true do |t|
    t.string   "status"
    t.integer  "client_id"
    t.integer  "object_id"
    t.string   "object_type"
    t.datetime "check_at"
    t.datetime "processed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.string   "tag"
    t.integer  "user_id"
    t.string   "reason"
    t.integer  "area_id"
  end

  create_table "quality_assurance_activities", :force => true do |t|
    t.string   "activity_tag"
    t.datetime "check_at"
    t.datetime "overdue_at"
    t.datetime "finished_at"
    t.integer  "user_id"
    t.integer  "client_id"
    t.integer  "area_id"
    t.integer  "object_id"
    t.string   "object_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.date     "report_on"
    t.integer  "program_id"
  end

  add_index "quality_assurance_activities", ["area_id"], :name => "index_quality_assurance_activities_on_area_id"
  add_index "quality_assurance_activities", ["check_at"], :name => "index_quality_assurance_activities_on_check_at"
  add_index "quality_assurance_activities", ["client_id"], :name => "index_quality_assurance_activities_on_client_id"
  add_index "quality_assurance_activities", ["created_at"], :name => "index_quality_assurance_activities_on_created_at"
  add_index "quality_assurance_activities", ["finished_at"], :name => "index_quality_assurance_activities_on_finished_at"
  add_index "quality_assurance_activities", ["object_id", "object_type"], :name => "index_quality_assurance_activities_on_object_id_and_object_type"
  add_index "quality_assurance_activities", ["report_on"], :name => "index_quality_assurance_activities_on_report_on"
  add_index "quality_assurance_activities", ["user_id"], :name => "index_quality_assurance_activities_on_user_id"

  create_table "quality_assurance_activity_statistics", :force => true do |t|
    t.integer  "assuranceable_id"
    t.string   "assuranceable_type"
    t.string   "activity_tag"
    t.text     "breakdown"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "quality_assurance_activity_tasks", :force => true do |t|
    t.datetime "checked_at"
    t.boolean  "passed"
    t.integer  "quality_assurance_activity_id"
    t.integer  "quality_assurance_task_id"
    t.integer  "task_object_id"
    t.string   "task_object_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  add_index "quality_assurance_activity_tasks", ["quality_assurance_activity_id"], :name => "qaat_qaa_id"
  add_index "quality_assurance_activity_tasks", ["quality_assurance_task_id"], :name => "qaat_qat_id"
  add_index "quality_assurance_activity_tasks", ["task_object_id", "task_object_type"], :name => "qaat_taskobject_poly"

  create_table "quality_assurance_statistics", :force => true do |t|
    t.integer  "assuranceable_id"
    t.string   "assuranceable_type"
    t.string   "tag"
    t.text     "breakdown"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "quality_assurance_tasks", :force => true do |t|
    t.string   "name"
    t.string   "nickname"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "position"
  end

  create_table "races", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "ramp_requests", :force => true do |t|
    t.integer  "client_movement"
    t.integer  "client_weight"
    t.integer  "wheelchair_size"
    t.text     "accessible_doors"
    t.integer  "ground_door"
    t.integer  "preferred_door"
    t.integer  "landing_height"
    t.integer  "landing_steps"
    t.integer  "threshold_height"
    t.integer  "ramp_completion_form_id"
    t.text     "case_manager_notes"
    t.text     "env_mod_specialist_notes"
    t.string   "status"
    t.integer  "home_assessment_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "ramp_requests", ["home_assessment_id"], :name => "index_ramp_requests_on_home_assessment_id"

  create_table "rationale_for_increased_service_units_request_custom_fields", :force => true do |t|
    t.integer  "rationale_for_increased_service_units_request_id"
    t.float    "pci_service_units_requested"
    t.float    "pcii_service_units_requested"
    t.float    "adhc_service_units_requested"
    t.float    "attending_service_units_requested"
    t.float    "individual_companion_service_units_requested"
    t.float    "agency_companion_service_units_requested"
    t.string   "length_of_time_for_increases"
    t.boolean  "participant_recent_hospitalization"
    t.boolean  "participant_decline_in_physical_condition"
    t.boolean  "participant_decline_in_mental_condition"
    t.boolean  "participant_decrease_in_family_support"
    t.boolean  "participant_decrease_in_community_support"
    t.boolean  "participant_family_seeking_nursing_home_placement"
    t.boolean  "participant_change_in_home_environment"
    t.boolean  "participant_lives_in_rural_area"
    t.boolean  "participant_has_paid_family_caregiver"
    t.boolean  "caregiver_recent_hospitalization"
    t.boolean  "caregiver_decline_in_physical_condition"
    t.boolean  "caregiver_decline_in_mental_condition"
    t.boolean  "caregiver_work_schedule_change"
    t.boolean  "caregiver_unable_to_provide_care"
    t.boolean  "caregiver_dead"
    t.boolean  "caregiver_out_of_town"
    t.boolean  "caregiver_other_changes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",                 :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded",             :default => false
  end

  create_table "realized_authorizations", :force => true do |t|
    t.integer  "client_id"
    t.integer  "provider_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.string   "status"
    t.integer  "authorization_referral_id"
    t.integer  "realized_authorization_id"
    t.datetime "provider_accepted_at"
    t.datetime "sent_to_provider_at"
    t.datetime "provider_declined_at"
    t.string   "provider_declined_reason"
    t.integer  "sequence_number"
    t.integer  "area_id"
    t.string   "type_authorization"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
    t.integer  "service_plan_id"
    t.boolean  "first_authorization"
  end

  add_index "realized_authorizations", ["client_id"], :name => "index_realized_authorizations_on_client_id"
  add_index "realized_authorizations", ["provider_id"], :name => "index_realized_authorizations_on_provider_id"
  add_index "realized_authorizations", ["service_id"], :name => "index_realized_authorizations_on_service_id"
  add_index "realized_authorizations", ["status"], :name => "index_realized_authorizations_on_status"

  create_table "realized_disciplines", :force => true do |t|
    t.integer  "service_plan_id"
    t.integer  "discipline_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.datetime "completed_at"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "realized_disciplines", ["service_plan_id", "discipline_id"], :name => "service_plan_id_discipline_id_index"
  add_index "realized_disciplines", ["service_plan_id"], :name => "service_plan_id"

  create_table "realized_intervention_actors", :force => true do |t|
    t.integer  "realized_intervention_id"
    t.integer  "actor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "realized_intervention_actors", ["actor_id", "created_by", "deleted_by"], :name => "index_on_actor_id_created_by_deleted_by"
  add_index "realized_intervention_actors", ["actor_id"], :name => "actor_id"
  add_index "realized_intervention_actors", ["realized_intervention_id"], :name => "realized_intervention_id"

  create_table "realized_interventions", :force => true do |t|
    t.integer  "intervention_id"
    t.integer  "realized_discipline_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "realized_interventions", ["deleted_at"], :name => "deleted_at"
  add_index "realized_interventions", ["intervention_id", "realized_discipline_id", "deleted_at"], :name => "intervention_id_2"
  add_index "realized_interventions", ["intervention_id"], :name => "intervention_id"
  add_index "realized_interventions", ["realized_discipline_id"], :name => "realized_discipline_id"

  create_table "realized_problems", :force => true do |t|
    t.boolean  "derived"
    t.integer  "problem_id"
    t.integer  "realized_discipline_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "required"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "realized_problems", ["realized_discipline_id"], :name => "realized_discipline_id"

  create_table "reasons", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "referral_reasons", :force => true do |t|
    t.integer  "referral_id"
    t.integer  "reason_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "referrals", :force => true do |t|
    t.integer  "client_application_id"
    t.string   "name"
    t.integer  "referral_type_id"
    t.integer  "mode"
    t.integer  "source"
    t.integer  "location"
    t.string   "reason_unaware"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "aware_of_referral"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "referrals", ["client_application_id"], :name => "index_referrals_on_client_application_id"

  create_table "relationships", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "reports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "review_outcomes", :force => true do |t|
    t.string   "outcome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "review_questions", :force => true do |t|
    t.integer  "order"
    t.integer  "severity_level"
    t.string   "choice_type"
    t.string   "choice_negative_fun"
    t.string   "ask_if_fun"
    t.string   "type"
    t.text     "question"
    t.text     "report_negative"
    t.text     "choice_text"
    t.boolean  "choice_boolean"
    t.boolean  "universal",                                           :default => false
    t.string   "universal_id"
    t.decimal  "universal_compliance", :precision => 10, :scale => 2
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "job_id"
  end

  create_table "review_samples", :force => true do |t|
    t.integer  "review_id"
    t.integer  "sampleable_id"
    t.string   "sampleable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "review_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "reviews", :force => true do |t|
    t.float    "score"
    t.string   "outcome"
    t.boolean  "completed",                             :default => false
    t.datetime "review_range_start"
    t.datetime "review_range_end"
    t.integer  "provider_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.float    "final_score"
    t.integer  "review_outcome_id"
    t.integer  "review_type_id"
    t.boolean  "uploaded",                              :default => false
    t.text     "provider_signature"
    t.text     "service_reviews_comment"
    t.text     "staff_reviews_comment"
    t.text     "comment"
    t.datetime "downloaded_at"
    t.datetime "uploaded_at"
    t.datetime "completed_at"
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 128
    t.string   "display_name"
    t.integer  "roleable_id"
    t.string   "roleable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "priority"
    t.integer  "creation_priority"
  end

  create_table "routes", :force => true do |t|
    t.string "name"
    t.string "abbreviation"
  end

  create_table "sanity", :id => false, :force => true do |t|
    t.integer "provider_id",    :null => false
    t.integer "carecall_count", :null => false
    t.integer "phoenix_count",  :null => false
  end

  create_table "scanned_documents", :force => true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "name"
    t.string   "tag"
    t.string   "document"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "service_answers", :force => true do |t|
    t.text     "choice_text"
    t.boolean  "choice_boolean"
    t.datetime "choice_date"
    t.integer  "service_question_id"
    t.integer  "service_review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "service_answers", ["deleted_at"], :name => "index_service_answers_on_deleted_at"
  add_index "service_answers", ["service_question_id"], :name => "index_service_answers_on_service_question_id"
  add_index "service_answers", ["service_review_id", "deleted_at"], :name => "service_answers_id_delete_index"
  add_index "service_answers", ["service_review_id"], :name => "index_service_answers_on_service_review_id"

  create_table "service_area_points", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "service_areas", :force => true do |t|
    t.string   "state"
    t.integer  "provider_id"
    t.integer  "county_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  add_index "service_areas", ["provider_id"], :name => "index_service_areas_on_provider_id"

  create_table "service_groups", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "provider_searchable"
    t.boolean  "discontinued",          :default => false
    t.integer  "display_order",         :default => 999
    t.boolean  "combine_service_level"
  end

  create_table "service_levels", :force => true do |t|
    t.integer  "service_plan_id"
    t.integer  "serviceable_id"
    t.string   "status"
    t.decimal  "requested_units",                       :precision => 5, :scale => 1, :default => 0.0
    t.decimal  "approved_units",                        :precision => 5, :scale => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "requested_by"
    t.datetime "requested_at"
    t.integer  "approved_by"
    t.datetime "approved_at"
    t.integer  "requested_frequency_id"
    t.integer  "approved_frequency_id"
    t.string   "serviceable_type"
    t.boolean  "new_record_waiting_to_be_uploaded",                                   :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded",                               :default => false
    t.string   "worker_initials"
  end

  create_table "service_matches", :force => true do |t|
    t.integer  "client_id"
    t.integer  "provider_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  add_index "service_matches", ["client_id", "provider_id"], :name => "index_service_matches_on_client_id_and_provider_id"
  add_index "service_matches", ["service_id"], :name => "index_service_matches_on_service_id"

  create_table "service_plans", :force => true do |t|
    t.integer  "assessment_id"
    t.date     "effective_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.datetime "completed_at"
    t.text     "assessor_signature_data"
    t.text     "reviewer_signature_data"
    t.date     "assessor_signed_on"
    t.date     "reviewer_signed_on"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
    t.text     "participant_signature_data"
    t.date     "participant_signed_on"
    t.text     "case_manager_signature_data"
    t.date     "case_manager_signed_on"
    t.datetime "providers_last_notified_at"
  end

  add_index "service_plans", ["assessment_id"], :name => "index_service_plans_on_assessment_id"

  create_table "service_procedures", :force => true do |t|
    t.string   "cltc_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  add_index "service_procedures", ["cltc_code"], :name => "index_service_procedures_on_cltc_code"

  create_table "service_programs", :force => true do |t|
    t.integer  "program_id"
    t.integer  "service_id"
    t.boolean  "waivered"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.string   "procedure_code"
    t.decimal  "unit_cost",              :precision => 10, :scale => 4
    t.boolean  "allow_unit_cost_change"
    t.boolean  "sc_choice_budget"
    t.boolean  "sc_cost_out"
    t.string   "unit"
    t.string   "period"
    t.boolean  "lock_unit_cost"
    t.boolean  "budget_weekly"
  end

  add_index "service_programs", ["program_id"], :name => "index_service_programs_on_program_id"
  add_index "service_programs", ["service_id"], :name => "index_service_programs_on_service_id"

  create_table "service_rate_adjustments", :force => true do |t|
    t.decimal  "min_rate",   :precision => 10, :scale => 4
    t.decimal  "max_rate",   :precision => 10, :scale => 4
    t.decimal  "emp_rate",   :precision => 10, :scale => 4
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  add_index "service_rate_adjustments", ["service_id"], :name => "index_service_rate_adjustments_on_service_id"

  create_table "service_reviews", :force => true do |t|
    t.integer  "review_id"
    t.boolean  "completed",                             :default => false
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "ddsn_client_id"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "service_reviews", ["client_id"], :name => "index_service_reviews_on_client_id"
  add_index "service_reviews", ["completed"], :name => "index_service_reviews_on_completed"
  add_index "service_reviews", ["ddsn_client_id"], :name => "index_service_reviews_on_ddsn_client_id"
  add_index "service_reviews", ["deleted_at"], :name => "index_service_reviews_on_deleted_at"
  add_index "service_reviews", ["review_id", "deleted_at"], :name => "index_service_reviews_on_review_id_and_deleted_at"
  add_index "service_reviews", ["review_id"], :name => "index_service_reviews_on_review_id"

  create_table "services", :force => true do |t|
    t.string   "cltc_code"
    t.string   "name"
    t.string   "unit"
    t.string   "period"
    t.decimal  "unit_cost",                    :precision => 15, :scale => 10
    t.boolean  "allow_unit_cost_change"
    t.boolean  "lock_unit_cost"
    t.boolean  "sc_choice_budget"
    t.boolean  "sc_cost_out"
    t.boolean  "budget_weekly"
    t.boolean  "reviewed"
    t.boolean  "waivered"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "budget_income",                                                :default => false
    t.boolean  "budget_expense_with_rate",                                     :default => false
    t.boolean  "budget_expense_without_rate",                                  :default => false
    t.integer  "budget_period_in_weeks",                                       :default => 1
    t.string   "budget_display_period",                                        :default => "per week"
    t.integer  "qty_in_bulk",                                                  :default => 1
    t.integer  "unit_definition_id"
    t.integer  "authorization_frequency_id"
    t.integer  "authorization_detail_type_id"
    t.string   "service_mixin"
    t.string   "abbreviation"
    t.integer  "service_group_id"
    t.boolean  "authorizable",                                                 :default => true
    t.boolean  "referrable"
    t.boolean  "provider_searchable"
    t.boolean  "discontinued",                                                 :default => false
    t.integer  "position"
    t.integer  "display_order",                                                :default => 999
    t.boolean  "flagged_for_carecall",                                         :default => false
    t.boolean  "need_check_memo",                                              :default => false
    t.decimal  "max_allowed_units",            :precision => 12, :scale => 10
    t.boolean  "flagged_for_ddsn",                                             :default => false
  end

  add_index "services", ["authorization_detail_type_id"], :name => "index_services_on_authorization_detail_type_id"
  add_index "services", ["authorization_frequency_id"], :name => "index_services_on_authorization_frequency_id"
  add_index "services", ["budget_expense_with_rate"], :name => "index_services_on_budget_expense_with_rate"
  add_index "services", ["budget_expense_without_rate"], :name => "index_services_on_budget_expense_without_rate"
  add_index "services", ["budget_income"], :name => "index_services_on_budget_income"
  add_index "services", ["cltc_code"], :name => "index_services_on_cltc_code"
  add_index "services", ["unit_definition_id"], :name => "index_services_on_unit_definition_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "site_notifications", :force => true do |t|
    t.text     "message"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "specialities", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "staff", :force => true do |t|
    t.integer  "old_strikes",      :default => 0
    t.integer  "current_strikes",  :default => 0
    t.string   "cltc_code"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_initial"
    t.string   "ssn"
    t.boolean  "nurse_supervisor"
    t.integer  "provider_id"
    t.datetime "start_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  add_index "staff", ["cltc_code"], :name => "index_staff_on_cltc_code"

  create_table "staff_answers", :force => true do |t|
    t.text     "choice_text"
    t.boolean  "choice_boolean"
    t.datetime "choice_date"
    t.integer  "staff_question_id"
    t.integer  "staff_review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "staff_answers", ["deleted_at"], :name => "index_staff_answers_on_deleted_at"
  add_index "staff_answers", ["staff_question_id"], :name => "index_staff_answers_on_staff_question_id"
  add_index "staff_answers", ["staff_review_id", "deleted_at"], :name => "staff_answers_id_delete_index"
  add_index "staff_answers", ["staff_review_id"], :name => "index_staff_answers_on_staff_review_id"

  create_table "staff_authorizations", :force => true do |t|
    t.integer  "staff_id"
    t.integer  "authorization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "staff_jobs", :force => true do |t|
    t.integer  "job_id"
    t.integer  "staffable_id"
    t.string   "staffable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "staff_reviews", :force => true do |t|
    t.integer  "review_id"
    t.boolean  "completed",                             :default => false
    t.integer  "staff_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "ddsn_staff_id"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  add_index "staff_reviews", ["completed"], :name => "index_staff_reviews_on_completed"
  add_index "staff_reviews", ["ddsn_staff_id"], :name => "index_staff_reviews_on_ddsn_staff_id"
  add_index "staff_reviews", ["deleted_at"], :name => "index_staff_reviews_on_deleted_at"
  add_index "staff_reviews", ["review_id", "deleted_at"], :name => "index_staff_reviews_on_review_id_and_deleted_at"
  add_index "staff_reviews", ["review_id"], :name => "index_staff_reviews_on_review_id"
  add_index "staff_reviews", ["service_id"], :name => "index_staff_reviews_on_service_id"
  add_index "staff_reviews", ["staff_id"], :name => "index_staff_reviews_on_staff_id"

  create_table "staff_services", :force => true do |t|
    t.integer  "staffable_id"
    t.string   "staffable_type"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.boolean  "new_record_waiting_to_be_uploaded",     :default => false
    t.boolean  "updated_record_waiting_to_be_uploaded", :default => false
  end

  create_table "states", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "sub_service_answers", :force => true do |t|
    t.text     "choice_text"
    t.boolean  "choice_boolean"
    t.datetime "choice_date"
    t.string   "choice_selected_option"
    t.integer  "authorizable_id"
    t.string   "authorizable_type"
    t.integer  "sub_service_question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "sub_service_questions", :force => true do |t|
    t.integer  "order",          :default => 0
    t.string   "question"
    t.string   "comments"
    t.string   "choice_type"
    t.text     "choice_options"
    t.string   "condition"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.string   "item_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  add_index "subscriptions", ["item_id", "item_type"], :name => "index_subscriptions_on_item_id_and_item_type"
  add_index "subscriptions", ["user_id"], :name => "index_subscriptions_on_user_id"

  create_table "suffixes", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "tablet_review_histories", :force => true do |t|
    t.float    "final_score"
    t.text     "provider_signature"
    t.datetime "review_range_start"
    t.datetime "review_range_end"
    t.string   "provider_name"
    t.integer  "service_id"
    t.integer  "review_outcome_id"
    t.integer  "review_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "tablets", :force => true do |t|
    t.integer  "user_id"
    t.string   "laptop"
    t.string   "operating_system"
    t.string   "phoenix_version"
    t.string   "antivirus"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "therapeutic_classes", :force => true do |t|
    t.string "name"
  end

  create_table "time_of_days", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "order"
  end

  add_index "time_of_days", ["order"], :name => "index_time_of_days_on_order"

  create_table "tracking_numbers", :force => true do |t|
    t.integer  "realized_authorization_id"
    t.integer  "tracking_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "area_id"
    t.integer  "client_id"
    t.integer  "sequence_number"
    t.string   "create_date"
  end

  create_table "treatments", :force => true do |t|
    t.string   "name"
    t.boolean  "ostomy"
    t.boolean  "therapy"
    t.boolean  "skilled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.datetime "inactive_at"
    t.integer  "inactive_by"
    t.string   "nickname"
  end

  create_table "unit_definitions", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "universal_answers", :force => true do |t|
    t.text     "choice_text"
    t.boolean  "choice_boolean"
    t.datetime "choice_date"
    t.integer  "reviewee_id"
    t.string   "reviewee_type"
    t.integer  "universal_question_id"
    t.integer  "universal_review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.string   "explanation"
  end

  add_index "universal_answers", ["deleted_at"], :name => "index_universal_answers_on_deleted_at"
  add_index "universal_answers", ["reviewee_type", "reviewee_id"], :name => "universal_answers_reviewee_index"
  add_index "universal_answers", ["universal_question_id"], :name => "index_universal_answers_on_universal_question_id"
  add_index "universal_answers", ["universal_review_id", "deleted_at"], :name => "universal_answers_id_delete_index"
  add_index "universal_answers", ["universal_review_id"], :name => "universal_answers_id_index"

  create_table "universal_reviews", :force => true do |t|
    t.integer  "review_id"
    t.boolean  "completed",  :default => true
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  add_index "universal_reviews", ["completed"], :name => "index_universal_reviews_on_completed"
  add_index "universal_reviews", ["deleted_at"], :name => "index_universal_reviews_on_deleted_at"
  add_index "universal_reviews", ["review_id", "deleted_at"], :name => "universal_reviews_id_delete_index"
  add_index "universal_reviews", ["review_id"], :name => "index_universal_reviews_on_review_id"
  add_index "universal_reviews", ["service_id"], :name => "index_universal_reviews_on_service_id"

  create_table "user_roles", :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",                :limit => 128
    t.string   "salt",                            :limit => 128
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
    t.integer  "meta_provider_id"
    t.string   "forgotten_password_code",         :limit => 128
    t.datetime "forgotten_password_requested_at"
    t.string   "remember_token",                  :limit => 128
    t.datetime "remember_token_expires_at"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "start_at"
    t.string   "carecall_access"
    t.string   "carecall_password"
    t.datetime "end_at"
    t.integer  "worker_id"
    t.boolean  "prevent_tablet_purge",                           :default => false
    t.boolean  "force_tablet_purge",                             :default => false
  end

  add_index "users", ["deleted_at"], :name => "index_users_on_deleted_at"
  add_index "users", ["id", "deleted_at"], :name => "index_users_on_id_and_deleted_at"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["meta_provider_id"], :name => "index_users_on_meta_provider_id"

  create_table "waiting_list_exemptions", :force => true do |t|
    t.string   "name"
    t.string   "nickname"
    t.datetime "inactive_at"
    t.integer  "inactive_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  create_table "waiting_list_outcomes", :force => true do |t|
    t.integer  "program_id"
    t.integer  "client_id"
    t.integer  "application_state_change_reason_id"
    t.integer  "days_on_list"
    t.integer  "final_score"
    t.boolean  "successful"
    t.datetime "created_at"
  end

  create_table "waiting_list_volumes", :force => true do |t|
    t.integer  "program_id"
    t.integer  "total"
    t.integer  "flagged"
    t.integer  "dormant"
    t.string   "totals_by_area"
    t.string   "flagged_by_area"
    t.string   "dormant_by_area"
    t.datetime "created_at"
  end

  create_table "web_requests", :force => true do |t|
    t.integer  "requested_by_id"
    t.string   "request_url"
    t.string   "request_controller"
    t.string   "request_action"
    t.text     "request_params",     :limit => 2147483647
    t.text     "requestor_roles"
    t.datetime "created_at"
    t.boolean  "on_tablet",                                :default => false
  end

  create_table "zip_codes", :force => true do |t|
    t.string   "value"
    t.string   "city"
    t.integer  "state_id"
    t.integer  "location_density_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

  add_index "zip_codes", ["value"], :name => "index_zip_codes_on_value"

  create_table "zip_county_links", :force => true do |t|
    t.integer  "county_id"
    t.integer  "zip_code_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "deleted_by"
  end

end
