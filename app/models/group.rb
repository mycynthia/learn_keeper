class Group < ApplicationRecord
  # validates_presence_of :name, :image, :description
  mount_uploader :image, GroupUploader
  has_many :label_groups
  has_many :labels, through: :label_groups
  has_many :group_records
  has_many :users, through: :group_records
  belongs_to :user
end
