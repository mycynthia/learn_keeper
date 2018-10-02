class Group < ApplicationRecord
  # validates_presence_of :name, :image, :description
  has_many :label_groups
  has_many :labels, through: :label_groups
end
