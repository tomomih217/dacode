class Level < ApplicationRecord
  has_many :records, dependent: :destroy

  validates :name, presence: true
end
