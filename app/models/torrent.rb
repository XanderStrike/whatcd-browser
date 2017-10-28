class Torrent < ActiveRecord::Base
  belongs_to :torrent_group, foreign_key:'GroupID'
end
