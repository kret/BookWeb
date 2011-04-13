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

ActiveRecord::Schema.define(:version => 20110413212932) do

  create_table "contributions", :force => true do |t|
    t.integer  "role_id"
    t.integer  "person_id"
    t.integer  "contributable_id"
    t.string   "contributable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editions", :force => true do |t|
    t.string   "title"
    t.string   "translator"
    t.string   "isbn"
    t.string   "edition_year"
    t.string   "issue_number"
    t.string   "language"
    t.integer  "number_of_tomes"
    t.integer  "publication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "cover_id"
    t.integer  "editor_id"
  end

  create_table "editors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.date     "date_of_death"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", :force => true do |t|
    t.string   "image"
    t.integer  "editions_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publications", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
