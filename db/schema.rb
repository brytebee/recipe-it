ActiveRecord::Schema[7.0].define(version: 2022_05_16_214933) do
  enable_extension "plpgsql"

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.time "preparation_time"
    t.time "cooking_time"
    t.text "description"
    t.boolean "public"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "recipes", "users"
end
