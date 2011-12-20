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

ActiveRecord::Schema.define(:version => 20111211200030) do

  create_table "addresses", :force => true do |t|
    t.string   "firma"
    t.string   "vorname"
    t.string   "nachname"
    t.string   "position"
    t.string   "briefkontakt"
    t.string   "strasse"
    t.string   "hausnr"
    t.string   "plz"
    t.string   "ort"
    t.string   "land"
    t.string   "fon"
    t.string   "fax"
    t.string   "email"
    t.string   "web"
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.string   "user"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["email"], :name => "index_addresses_on_email", :unique => true
  add_index "addresses", ["firma"], :name => "index_addresses_on_firma"
  add_index "addresses", ["nachname"], :name => "index_addresses_on_nachname"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "code",       :null => false
    t.string   "engl",       :null => false
    t.string   "de",         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lettercontacts", :force => true do |t|
    t.string   "description", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lookups", :force => true do |t|
    t.string   "thema",      :null => false
    t.string   "anzeige",    :null => false
    t.string   "intern",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subcategories", :force => true do |t|
    t.string   "name",        :null => false
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "last_visit"
    t.boolean  "admin",              :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "aktiv",              :default => true
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
