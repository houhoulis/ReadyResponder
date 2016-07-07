class ItemType < ApplicationRecord
  # attr_accessible :is_a_group, :is_groupable, :name, :parent_id, :status
  has_many :items
  def to_s
    name
  end
end
