class Level < ApplicationRecord
  has_many :records, dependent: :destroy

  validates :name, presence: true
  validates :level_image, presence: true
end
