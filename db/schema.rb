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

ActiveRecord::Schema.define(version: 20161126235409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "area_atuacaos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categoria_objetos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cidades", force: :cascade do |t|
    t.string   "nome"
    t.integer  "estado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estado_id"], name: "index_cidades_on_estado_id", using: :btree
  end

  create_table "doacaos", force: :cascade do |t|
    t.integer  "usuario_id"
    t.integer  "objeto_id"
    t.integer  "quantidade"
    t.integer  "status"
    t.string   "observacoes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["objeto_id"], name: "index_doacaos_on_objeto_id", using: :btree
    t.index ["usuario_id"], name: "index_doacaos_on_usuario_id", using: :btree
  end

  create_table "estados", force: :cascade do |t|
    t.string   "nome"
    t.string   "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instituicaos", force: :cascade do |t|
    t.integer  "area_atuacao_id"
    t.string   "documento"
    t.string   "nome"
    t.string   "email"
    t.string   "senha"
    t.string   "codigo"
    t.integer  "cidade_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["area_atuacao_id"], name: "index_instituicaos_on_area_atuacao_id", using: :btree
    t.index ["cidade_id"], name: "index_instituicaos_on_cidade_id", using: :btree
  end

  create_table "objetos", force: :cascade do |t|
    t.integer  "categoria_objeto_id"
    t.integer  "instituicao_id"
    t.string   "nome"
    t.string   "unidade_medida"
    t.integer  "meta"
    t.string   "observacoes"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["categoria_objeto_id"], name: "index_objetos_on_categoria_objeto_id", using: :btree
    t.index ["instituicao_id"], name: "index_objetos_on_instituicao_id", using: :btree
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "documento"
    t.string   "nome"
    t.string   "email"
    t.string   "senha"
    t.integer  "cidade_id"
    t.boolean  "isPJ"
    t.boolean  "isInstituicao"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["cidade_id"], name: "index_usuarios_on_cidade_id", using: :btree
  end

  add_foreign_key "cidades", "estados"
  add_foreign_key "doacaos", "objetos"
  add_foreign_key "doacaos", "usuarios"
  add_foreign_key "instituicaos", "area_atuacaos"
  add_foreign_key "instituicaos", "cidades"
  add_foreign_key "objetos", "categoria_objetos"
  add_foreign_key "objetos", "instituicaos"
  add_foreign_key "usuarios", "cidades"
end
