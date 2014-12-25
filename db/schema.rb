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

ActiveRecord::Schema.define(version: 20150106011850) do

  create_table "activities", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "subject_id"
    t.integer  "task_id"
    t.string   "temp_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_subjects", force: true do |t|
    t.integer  "course_id"
    t.integer  "subject_id"
    t.boolean  "status",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_subjects", ["course_id", "subject_id"], name: "index_course_subjects_on_course_id_and_subject_id", unique: true, using: :btree
  add_index "course_subjects", ["course_id"], name: "index_course_subjects_on_course_id", using: :btree
  add_index "course_subjects", ["subject_id"], name: "index_course_subjects_on_subject_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "duration"
    t.integer  "user_id"
  end

  create_table "enrollment_subject_tasks", force: true do |t|
    t.integer  "enrollment_subject_id"
    t.integer  "task_id"
    t.integer  "user_id"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enrollment_subject_tasks", ["user_id"], name: "index_enrollment_subject_tasks_on_user_id", using: :btree

  create_table "enrollment_subjects", force: true do |t|
    t.integer  "enrollment_id"
    t.integer  "course_id"
    t.integer  "subject_id"
    t.integer  "user_id"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enrollment_subjects", ["course_id", "subject_id"], name: "index_enrollment_subjects_on_course_id_and_subject_id", unique: true, using: :btree
  add_index "enrollment_subjects", ["course_id"], name: "index_enrollment_subjects_on_course_id", using: :btree
  add_index "enrollment_subjects", ["enrollment_id"], name: "index_enrollment_subjects_on_enrollment_id", using: :btree
  add_index "enrollment_subjects", ["subject_id"], name: "index_enrollment_subjects_on_subject_id", using: :btree
  add_index "enrollment_subjects", ["user_id"], name: "index_enrollment_subjects_on_user_id", using: :btree

  create_table "enrollments", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status",     default: false
  end

  add_index "enrollments", ["course_id"], name: "index_enrollments_on_course_id", using: :btree
  add_index "enrollments", ["user_id", "course_id"], name: "index_enrollments_on_user_id_and_course_id", unique: true, using: :btree
  add_index "enrollments", ["user_id"], name: "index_enrollments_on_user_id", using: :btree

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "instruction"
  end

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_digest"
    t.boolean  "supervisor",      default: false
  end

end
