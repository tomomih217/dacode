class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :records, dependent: :destroy
  has_many :kusocodes, dependent: :destroy
  has_many :flowers, dependent: :destroy
  has_many :flowered_kusocodes, through: :flowers, source: :kusocode

  validates :username, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  # ユーザーに紐付いているobjectかを判定
  def own?(object)
    id == object.user_id
  end

  # いいね追加機能
  def flowered(kusocode)
    flowered_kusocodes << kusocode
  end

  # いいね削除機能
  def unflowered(kusocode)
    flowered_kusocodes.destroy(kusocode)
  end

  # いいね済かをtrue/falseで返す
  def flowered?(kusocode)
    flowered_kusocodes.include?(kusocode)
  end
end
