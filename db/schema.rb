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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160223221641) do

  create_table "images", force: :cascade do |t|
    t.string   "name",          limit: 255, null: false
    t.integer  "inspection_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "capture",       limit: 255
  end

  add_index "images", ["inspection_id"], name: "index_images_on_inspection_id", using: :btree

  create_table "inspections", force: :cascade do |t|
    t.string   "study_of_name",      limit: 255
    t.string   "study_of_type",      limit: 255
    t.date     "date"
    t.string   "reason",             limit: 255
    t.text     "conclusion",         limit: 65535
    t.string   "diagnostic",         limit: 255
    t.text     "stomach",            limit: 65535
    t.text     "esophagus",          limit: 65535
    t.text     "duodenum",           limit: 65535
    t.text     "colonoscopy",        limit: 65535
    t.text     "rectal_examination", limit: 65535
    t.integer  "patient_id",         limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "inspections", ["patient_id"], name: "index_inspections_on_patient_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "firstname",          limit: 255
    t.string   "lastname",           limit: 255
    t.string   "type_document_cd",   limit: 255
    t.integer  "document_number",    limit: 4
    t.date     "birthdate"
    t.string   "nationality",        limit: 255
    t.string   "gender_cd",          limit: 255
    t.string   "obra_social_type",   limit: 255
    t.string   "obra_social_number", limit: 255
    t.string   "phone",              limit: 255
    t.string   "observations",       limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
