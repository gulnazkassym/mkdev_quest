ActiveRecord::Schema.define(version: 2020_03_26_095735) do

  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "location", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.string "organizer_email"
    t.string "organizer_telegram"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
