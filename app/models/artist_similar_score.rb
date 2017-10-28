# == Schema Information
#
# Table name: artists_similar_scores
#
#  SimilarID :integer          not null, primary key
#  Score     :integer          default(0), not null
#

class ArtistSimilarScore < ActiveRecord::Base
  self.table_name = 'artists_similar_scores'
end
