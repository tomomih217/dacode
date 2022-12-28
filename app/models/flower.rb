class Flower < ApplicationRecord
  belongs_to :user
  belongs_to :kusocode

  validates :user_id, uniqueness: { scope: :kusocode_id }
end
