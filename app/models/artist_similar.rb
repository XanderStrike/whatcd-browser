# == Schema Information
#
# Table name: artists_similar
#
#  ArtistID  :integer          default(0), not null
#  SimilarID :integer          default(0), not null
#

class ArtistSimilar < ActiveRecord::Base
  self.table_name = 'artists_similar'
end
