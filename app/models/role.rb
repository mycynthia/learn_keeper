class Role < ApplicationRecord
  has_many :role_records
  has_many :users, through: :role_records
end
