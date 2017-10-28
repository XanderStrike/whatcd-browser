# == Schema Information
#
# Table name: torrents
#
#  ID                      :integer          not null, primary key
#  GroupID                 :integer          not null
#  Media                   :string(20)
#  Format                  :string(10)
#  Encoding                :string(15)
#  Remastered              :string(1)        default("0"), not null
#  RemasterYear            :integer
#  RemasterTitle           :string(80)       default(""), not null
#  RemasterCatalogueNumber :string(80)       default(""), not null
#  RemasterRecordLabel     :string(80)       default(""), not null
#  Scene                   :string(1)        default("0"), not null
#  HasLog                  :string(1)        default("0"), not null
#  HasCue                  :string(1)        default("0"), not null
#  LogScore                :integer          default(0), not null
#  info_hash               :binary(65535)    not null
#  FileList                :text(16777215)   not null
#  FilePath                :string(255)      default(""), not null
#  Size                    :integer          not null
#  Time                    :datetime         default(NULL), not null
#

class Torrent < ActiveRecord::Base
  belongs_to :torrent_group, foreign_key:'GroupID'
end
