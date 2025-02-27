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

ActiveRecord::Schema.define(version: 20140429000424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: true do |t|
    t.integer  "paper_id"
    t.string   "name"
    t.string   "email"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "imported",   default: false
  end

  add_index "authors", ["paper_id"], name: "index_authors_on_paper_id", using: :btree

  create_table "issues", force: true do |t|
    t.integer  "journal_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "scraped",    default: false
  end

  add_index "issues", ["journal_id"], name: "index_issues_on_journal_id", using: :btree

  create_table "journals", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "papers", force: true do |t|
    t.integer  "issue_id"
    t.string   "doi"
    t.string   "title"
    t.datetime "published_at"
    t.string   "url"
    t.string   "keywords",     default: [],    array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "scraped",      default: false
  end

  add_index "papers", ["issue_id"], name: "index_papers_on_issue_id", using: :btree

end
