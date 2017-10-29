# == Schema Information
#
# Table name: collages
#
#  ID          :integer          not null, primary key
#  Name        :string(100)      default(""), not null
#  NumTorrents :integer          default(0), not null
#  CategoryID  :integer          default(1), not null
#  TagList     :string(500)      default(""), not null
#  Subscribers :integer          default(0)
#  updated     :datetime         not null
#

class Collage < ActiveRecord::Base
  def torrents(order)
    ActiveRecord::Base.connection.execute("select a.Name, a.ArtistID, tg.ID, tg.CatalogueNumber, tg.Year, tg.RecordLabel, tg.Name from collages c join collages_torrents ct on c.ID = ct.CollageID join torrents_group tg on ct.GroupID = tg.ID join torrents_artists ta on ta.Importance = 1 and tg.ID = ta.GroupID join artists_group a on ta.ArtistID = a.ArtistID where c.ID = #{self.ID} order by #{order}").to_a
  end

  def category
    ['Personal','Theme','Genre introduction','Discography','Label','Staff picks','Charts','Artists'][self.CategoryID]
  end

  def self.random
    total_rows = 26761 # this will never change
    Collage.offset(rand(total_rows)).limit(1).first
  end
end
