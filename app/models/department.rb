class Department < ApplicationRecord
  belongs_to :contact, class_name: "Person"
  has_many :people
  has_many :items
  has_many :locations
end
