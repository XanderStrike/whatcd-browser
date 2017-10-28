# == Schema Information
#
# Table name: torrents_tags
#
#  TagID         :integer          default(0), not null
#  GroupID       :integer          default(0), not null
#  PositiveVotes :integer          default(1), not null
#  NegativeVotes :integer          default(1), not null
#

class TorrentTag < ActiveRecord::Base
  self.table_name = 'torrents_tags'
end
