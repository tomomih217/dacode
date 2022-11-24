class Level < ApplicationRecord
  has_many :records, dependent: :destroy
end
