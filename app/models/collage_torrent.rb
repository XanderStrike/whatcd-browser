# == Schema Information
#
# Table name: collages_torrents
#
#  CollageID :integer          not null
#  GroupID   :integer          not null
#  Sort      :integer          default(0), not null
#  AddedOn   :datetime         default(NULL), not null
#

class CollageTorrent < ActiveRecord::Base
  self.table_name = 'collages_torrents'
end
