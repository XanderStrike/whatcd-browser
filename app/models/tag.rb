# == Schema Information
#
# Table name: tags
#
#  ID      :integer          not null, primary key
#  Name    :string(100)
#  TagType :string(5)        default("other"), not null
#  Uses    :integer          default(1), not null
#

class Tag < ActiveRecord::Base
end
