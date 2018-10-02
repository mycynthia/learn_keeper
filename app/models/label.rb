class Label < ApplicationRecord
  has_many :label_groups, dependent: :restrict_with_error
  has_many :groups, through: :label_groups
end
