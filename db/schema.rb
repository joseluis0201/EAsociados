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

ActiveRecord::Schema.define(version: 20161217222758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "contactos", force: :cascade do |t|
    t.string   "nombres"
    t.string   "email"
    t.string   "telefono"
    t.text     "mensaje"
    t.boolean  "visto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipos", force: :cascade do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "profesion"
    t.string   "imagen"
    t.string   "telefono"
    t.string   "correo"
    t.text     "descripcion"
    t.boolean  "estado"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "role_id"
  end

  add_index "equipos", ["role_id"], name: "index_equipos_on_role_id", using: :btree

  create_table "inscritos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "email"
    t.boolean  "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "titulo"
    t.text     "contenido"
    t.string   "imagen"
    t.boolean  "estado"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.integer  "equipo_id"
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id", using: :btree
  add_index "posts", ["equipo_id"], name: "index_posts_on_equipo_id", using: :btree

  create_table "postulantes", force: :cascade do |t|
    t.string   "nombres"
    t.string   "email"
    t.string   "cv"
    t.boolean  "visto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recursos", force: :cascade do |t|
    t.string   "titulo"
    t.string   "archivo"
    t.text     "links"
    t.integer  "servicio_id"
    t.boolean  "estado"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "recursos", ["servicio_id"], name: "index_recursos_on_servicio_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "nombre"
    t.boolean  "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectores", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.string   "imagen"
    t.boolean  "estado"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "servicios", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.string   "imagen"
    t.boolean  "estado"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subservicios", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.string   "imagen"
    t.boolean  "estado"
    t.integer  "servicio_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "subservicios", ["servicio_id"], name: "index_subservicios_on_servicio_id", using: :btree

  add_foreign_key "equipos", "roles"
  add_foreign_key "posts", "categories"
  add_foreign_key "posts", "equipos"
  add_foreign_key "recursos", "servicios"
  add_foreign_key "subservicios", "servicios"
end
