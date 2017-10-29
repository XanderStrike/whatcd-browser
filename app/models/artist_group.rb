# == Schema Information
#
# Table name: artists_group
#
#  ArtistID :integer          not null, primary key
#  Name     :string(200)
#

class ArtistGroup < ActiveRecord::Base
  self.table_name = 'artists_group'

  def torrent_groups(order)
    TorrentGroup.find_by_sql("select * from torrents_group tg join torrents_artists ta on ta.ArtistID = #{self.ArtistID} and ta.GroupID = tg.id where tg.ArtistID = #{self.ArtistID} or ta.ArtistID = #{self.ArtistID} order by #{order}").uniq
  end

  def similar
    ActiveRecord::Base.connection.execute("select sa.Name, s.SimilarID from artists_group a join artists_similar s on s.ArtistID = a.ArtistID join artists_group sa on sa.ArtistID = s.SimilarID  where a.ArtistID = #{self.ArtistID}").to_a
  end

  def self.random
    total_rows = 885304 # this will never change
    ArtistGroup.offset(rand(total_rows)).limit(1).first
  end
end
