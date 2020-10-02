class CheatSheet < ApplicationRecord
  has_many :stitches
  accepts_nested_attributes_for :stitches, allow_destroy: true, reject_if: :all_blank


  validates :title, presence: true
end
