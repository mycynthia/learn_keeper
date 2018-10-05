class Label < ApplicationRecord
  has_many :label_groups, dependent: :restrict_with_error
  has_many :groups, through: :label_groups
  has_and_belongs_to_many :users
end
