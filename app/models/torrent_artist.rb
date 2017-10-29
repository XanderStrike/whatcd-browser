# == Schema Information
#
# Table name: torrents_artists
#
#  GroupID    :integer          not null
#  ArtistID   :integer          not null
#  AliasID    :integer          not null
#  Importance :string(1)        default("1"), not null
#

class TorrentArtist < ActiveRecord::Base
  self.table_name = 'torrents_artists'

  belongs_to :artist_group, foreign_key: 'ArtistID'
end
