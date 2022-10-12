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

ActiveRecord::Schema.define(version: 0) do

  create_table "todos", primary_key: "todo_id", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "task", limit: 500
    t.date "due_date"
    t.boolean "is_done"
    t.bigint "user_id", unsigned: true
    t.index ["user_id"], name: "FK_UserTodo"
  end

  create_table "users", primary_key: "user_id", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "email", limit: 50
    t.string "password_digest", limit: 100
  end

  add_foreign_key "todos", "users", primary_key: "user_id", name: "FK_UserTodo"
end
