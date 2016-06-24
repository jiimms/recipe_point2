
ActiveRecord::Schema.define(version: 20160624161227) do

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id"

end
