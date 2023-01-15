require 'securerandom'
class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :records, dependent: :destroy
  has_many :kusocodes, dependent: :destroy
  has_many :flowers, dependent: :destroy
  has_many :flowered_kusocodes, through: :flowers, source: :kusocode
  has_many :answers, dependent: :destroy
  has_many :answered_quizzes, through: :answers, source: :quiz

  validates :username, presence: true, length: { maximum: 20 }, uniqueness: true

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  enum role: { member: 0, guest: 1, admin: 2 }

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

  # 回答済かを判定する
  def have_answer?(quiz_id)
    ans_array = answers.select{|answer|answer.quiz_id == quiz_id}
    ans_array[0].nil? ? false : true
  end

  # ゲストユーザーを作成する
  def self.create_guest_user
    user = User.new(username: SecureRandom.alphanumeric(10), password: 'guest', password_confirmation: 'guest', role: 1)
    user.save!
    user
  end
end
