# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin
# Level1の初期化
levels = Level.all
levels.each do |level|
  Level.destroy(level.id) unless level.id == 1
end

Level.update(1,
  name: 'Level1（お試し）',
  level_image: '/images/level1_img.jpg'
)

# Level1の回答
lv1_answer_array = ['ASSET', 'S', 'MODEL', 'STATEFUL', 'QUIT', 'NEW', 'READ']
(1..9).each do |n|
  Quiz.create!(
    quiz_id: 1100 + n,
    currect_answer: lv1_answer_array[n - 1],
    level_id: 1
  )
end
Quiz.create!(
  quiz_id: 1201,
  currect_answer: 'reverse(create)',
  level_id: 1
)
=end