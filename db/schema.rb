# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_102_162_520) do
  create_table 'invites', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'meeting_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['meeting_id'], name: 'index_invites_on_meeting_id'
    t.index ['user_id'], name: 'index_invites_on_user_id'
  end

  create_table 'meetings', force: :cascade do |t|
    t.text 'content'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'user_id', null: false
    t.datetime 'date'
    t.index ['user_id'], name: 'index_meetings_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['name'], name: 'index_users_on_name', unique: true
  end

  add_foreign_key 'invites', 'meetings'
  add_foreign_key 'invites', 'users'
  add_foreign_key 'meetings', 'users'
end
