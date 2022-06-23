# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_22_083358) do
  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "cellphone", limit: 20
    t.string "email", limit: 100
    t.string "password", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", limit: 25, default: "User"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
