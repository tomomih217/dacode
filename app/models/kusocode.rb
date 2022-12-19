class Kusocode < ApplicationRecord
  belongs_to :user

  validates :code, presence: true, length: { maximum: 65535 }
  validates :description, presence: true, length: { maximum: 255 }
end
