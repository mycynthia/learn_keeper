class Group < ApplicationRecord
  # validates_presence_of :name, :image, :description
  mount_uploader :image, GroupUploader
  has_many :label_groups
  has_many :labels, through: :label_groups
end
