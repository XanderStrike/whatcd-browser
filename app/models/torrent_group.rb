# == Schema Information
#
# Table name: torrents_group
#
#  ID              :integer          not null, primary key
#  ArtistID        :integer
#  CategoryID      :integer
#  Name            :string(300)
#  Year            :integer
#  CatalogueNumber :string(80)       default(""), not null
#  RecordLabel     :string(80)       default(""), not null
#  ReleaseType     :integer          default(21)
#  TagList         :string(500)      not null
#  Time            :datetime         default(NULL), not null
#

class TorrentGroup < ActiveRecord::Base
  self.table_name = 'torrents_group'

  has_many :torrents, foreign_key: 'GroupID'
  has_one :artist_alias, foreign_key: 'ArtistID'
end
