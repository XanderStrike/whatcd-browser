# == Schema Information
#
# Table name: artists_group
#
#  ArtistID :integer          not null, primary key
#  Name     :string(200)
#

class ArtistGroup < ActiveRecord::Base
  self.table_name = 'artists_group'

  has_many :torrent_groups, foreign_key: 'ArtistID'

  def similar
    ActiveRecord::Base.connection.execute("select sa.Name, s.SimilarID from artists_group a join artists_similar s on s.ArtistID = a.ArtistID join artists_group sa on sa.ArtistID = s.SimilarID  where a.ArtistID = #{self.ArtistID}").to_a
  end
end
