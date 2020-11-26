class Employee < ApplicationRecord
  has_many :salaries
  belongs_to :department
  belongs_to :user
end
