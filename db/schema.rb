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

ActiveRecord::Schema.define(version: 2023_01_13_053520) do

  create_table "answers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "quiz_id"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_answers_on_quiz_id"
    t.index ["user_id", "quiz_id"], name: "index_answers_on_user_id_and_quiz_id", unique: true
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "flowers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "kusocode_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kusocode_id"], name: "index_flowers_on_kusocode_id"
    t.index ["user_id", "kusocode_id"], name: "index_flowers_on_user_id_and_kusocode_id", unique: true
    t.index ["user_id"], name: "index_flowers_on_user_id"
  end

  create_table "kusocodes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.text "code", null: false
    t.string "description", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_kusocodes_on_user_id"
  end

  create_table "levels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "level_image", default: "/images/level_noimage.jpg", null: false
  end

  create_table "quizzes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "quiz_id", null: false
    t.string "currect_answer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "level_id"
    t.index ["level_id"], name: "index_quizzes_on_level_id"
  end

  create_table "records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "level_id"
    t.integer "status", default: 0, null: false
    t.index ["level_id"], name: "index_records_on_level_id"
    t.index ["user_id", "level_id"], name: "index_records_on_user_id_and_level_id", unique: true
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "username", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
  end

  add_foreign_key "answers", "quizzes"
  add_foreign_key "answers", "users"
  add_foreign_key "flowers", "kusocodes"
  add_foreign_key "flowers", "users"
  add_foreign_key "kusocodes", "users"
  add_foreign_key "quizzes", "levels"
  add_foreign_key "records", "levels"
  add_foreign_key "records", "users"
end
