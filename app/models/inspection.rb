class Inspection < ApplicationRecord

  belongs_to :item
  has_many :inspection_questions

  STATUS_CHOICES = ['Complete - Passed', 'Complete - Failed', 'Incomplete']

end
