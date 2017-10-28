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

ActiveRecord::Schema.define(version: 0) do

  create_table "artists_alias", primary_key: "AliasID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "ArtistID", null: false
    t.string "Name", limit: 200, collation: "utf8_swedish_ci"
    t.integer "Redirect", default: 0, null: false
    t.index ["ArtistID"], name: "ArtistID"
    t.index ["Name"], name: "Name"
  end

  create_table "artists_group", primary_key: "ArtistID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "Name", limit: 200, collation: "utf8_swedish_ci"
    t.index ["Name"], name: "Name"
  end

  create_table "artists_similar", primary_key: ["ArtistID", "SimilarID"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "ArtistID", default: 0, null: false
    t.integer "SimilarID", default: 0, null: false
    t.index ["ArtistID"], name: "ArtistID"
    t.index ["SimilarID"], name: "SimilarID"
  end

  create_table "artists_similar_scores", primary_key: "SimilarID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "Score", default: 0, null: false
    t.index ["Score"], name: "Score"
  end

  create_table "collages", primary_key: "ID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "Name", limit: 100, default: "", null: false, collation: "utf8_swedish_ci"
    t.integer "NumTorrents", default: 0, null: false
    t.integer "CategoryID", default: 1, null: false
    t.string "TagList", limit: 500, default: "", null: false
    t.integer "Subscribers", default: 0
    t.datetime "updated", null: false
    t.index ["CategoryID"], name: "CategoryID"
    t.index ["Name"], name: "Name", unique: true
  end

  create_table "collages_torrents", primary_key: ["CollageID", "GroupID"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "CollageID", null: false
    t.integer "GroupID", null: false
    t.integer "Sort", default: 0, null: false
    t.datetime "AddedOn", null: false
    t.index ["Sort"], name: "Sort"
  end

  create_table "tags", primary_key: "ID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "Name", limit: 100
    t.string "TagType", limit: 5, default: "other", null: false
    t.integer "Uses", default: 1, null: false
    t.index ["Name"], name: "Name_2", unique: true
    t.index ["TagType"], name: "TagType"
    t.index ["Uses"], name: "Uses"
  end

  create_table "torrents", primary_key: "ID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "GroupID", null: false
    t.string "Media", limit: 20
    t.string "Format", limit: 10
    t.string "Encoding", limit: 15
    t.string "Remastered", limit: 1, default: "0", null: false
    t.integer "RemasterYear"
    t.string "RemasterTitle", limit: 80, default: "", null: false
    t.string "RemasterCatalogueNumber", limit: 80, default: "", null: false
    t.string "RemasterRecordLabel", limit: 80, default: "", null: false
    t.string "Scene", limit: 1, default: "0", null: false
    t.string "HasLog", limit: 1, default: "0", null: false
    t.string "HasCue", limit: 1, default: "0", null: false
    t.integer "LogScore", default: 0, null: false
    t.binary "info_hash", null: false
    t.text "FileList", limit: 16777215, null: false
    t.string "FilePath", default: "", null: false
    t.bigint "Size", null: false
    t.datetime "Time", null: false
    t.index ["Encoding"], name: "Encoding"
    t.index ["Format"], name: "Format"
    t.index ["GroupID"], name: "GroupID"
    t.index ["Media"], name: "Media"
    t.index ["RemasterYear"], name: "Year"
    t.index ["Size"], name: "Size"
    t.index ["Time"], name: "Time"
    t.index ["info_hash"], name: "InfoHash", unique: true, length: { info_hash: 40 }
  end

  create_table "torrents_artists", primary_key: ["GroupID", "ArtistID", "Importance"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "GroupID", null: false
    t.integer "ArtistID", null: false
    t.integer "AliasID", null: false
    t.string "Importance", limit: 1, default: "1", null: false
    t.index ["AliasID"], name: "AliasID"
    t.index ["ArtistID"], name: "ArtistID"
    t.index ["GroupID"], name: "GroupID"
    t.index ["Importance"], name: "Importance"
  end

  create_table "torrents_group", primary_key: "ID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "ArtistID"
    t.integer "CategoryID"
    t.string "Name", limit: 300
    t.integer "Year"
    t.string "CatalogueNumber", limit: 80, default: "", null: false
    t.string "RecordLabel", limit: 80, default: "", null: false
    t.integer "ReleaseType", limit: 1, default: 21
    t.string "TagList", limit: 500, null: false
    t.datetime "Time", null: false
    t.index ["ArtistID"], name: "ArtistID"
    t.index ["CategoryID"], name: "CategoryID"
    t.index ["Name"], name: "Name", length: { Name: 255 }
    t.index ["Time"], name: "Time"
    t.index ["Year"], name: "Year"
  end

  create_table "torrents_tags", primary_key: ["TagID", "GroupID"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "TagID", default: 0, null: false
    t.integer "GroupID", default: 0, null: false
    t.integer "PositiveVotes", default: 1, null: false
    t.integer "NegativeVotes", default: 1, null: false
    t.index ["GroupID"], name: "GroupID"
    t.index ["NegativeVotes"], name: "NegativeVotes"
    t.index ["PositiveVotes"], name: "PositiveVotes"
    t.index ["TagID"], name: "TagID"
  end

end
