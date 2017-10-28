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
end
