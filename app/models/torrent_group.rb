class TorrentGroup < ActiveRecord::Base
  self.table_name = 'torrents_group'

  has_many :torrents, foreign_key: 'GroupID'
  has_one :torrent_artist, foreign_key: 'ArtistID'
end
