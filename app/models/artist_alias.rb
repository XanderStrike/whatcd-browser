# == Schema Information
#
# Table name: artists_alias
#
#  AliasID  :integer          not null, primary key
#  ArtistID :integer          not null
#  Name     :string(200)
#  Redirect :integer          default(0), not null
#

class ArtistAlias < ActiveRecord::Base
  self.table_name = 'artists_alias'

  has_many :torrent_groups, foreign_key: 'ArtistID'
end
