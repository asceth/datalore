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

  create_table "fields", :force => true do |t|
    t.integer  "report_id"
    t.boolean  "filterable",  :default => false
    t.boolean  "displayable", :default => false
    t.boolean  "groupable",   :default => false
    t.string   "name"
    t.string   "table_name"
    t.string   "column_name"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "joins", :force => true do |t|
    t.integer  "report_id"
    t.boolean  "root",               :default => false
    t.string   "primary_table_name"
    t.string   "primary_key"
    t.string   "foreign_table_name"
    t.string   "foreign_key"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "reports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "template_fields", :force => true do |t|
    t.integer  "template_id"
    t.integer  "field_id"
    t.integer  "field_type"
    t.integer  "position"
    t.string   "name"
    t.string   "function"
    t.string   "value"
    t.string   "operator"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "templates", :force => true do |t|
    t.integer  "report_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
