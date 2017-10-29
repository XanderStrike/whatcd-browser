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

class TorrentGroup < ApplicationRecord
  self.table_name = 'torrents_group'

  has_many :torrents, foreign_key: 'GroupID'
  belongs_to :artist_group, foreign_key: 'ArtistID'

  def release_type_name
    {
      1 => 'Album',
      3 => 'Soundtrack',
      5 => 'EP',
      6 => 'Anthology',
      7 => 'Compilation',
      9 => 'Single',
      11 => 'Live album',
      13 => 'Remix',
      14 => 'Bootleg',
      15 => 'Interview',
      16 => 'Mixtape',
      21 => 'Unknown'
    }[self.ReleaseType]
  end
end
