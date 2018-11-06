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

ActiveRecord::Schema.define(version: 2016_02_23_221641) do

  create_table "images", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "inspection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "capture"
    t.index ["inspection_id"], name: "index_images_on_inspection_id"
  end

  create_table "inspections", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "study_of_name"
    t.string "study_of_type"
    t.date "date"
    t.string "reason"
    t.text "conclusion"
    t.string "diagnostic"
    t.text "stomach"
    t.text "esophagus"
    t.text "duodenum"
    t.text "colonoscopy"
    t.text "rectal_examination"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_inspections_on_patient_id"
  end

  create_table "patients", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "type_document_cd"
    t.integer "document_number"
    t.date "birthdate"
    t.string "nationality"
    t.string "gender_cd"
    t.string "obra_social_type"
    t.string "obra_social_number"
    t.string "phone"
    t.string "observations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
