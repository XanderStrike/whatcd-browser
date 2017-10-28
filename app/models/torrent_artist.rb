class TorrentArtist < ActiveRecord::Base
  self.table_name = 'torrents_artists'

  # has_many :torrent_groups, foreign_key: 'ArtistID'

  def torrent_groups
    TorrentGroups.where(ArtistID: ID)
  end
end
