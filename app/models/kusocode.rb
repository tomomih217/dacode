class Kusocode < ApplicationRecord
  belongs_to :user
  has_many :flowers, dependent: :destroy

  validates :code, presence: true, length: { maximum: 65535 }
  validates :description, presence: true, length: { maximum: 255 }
end
