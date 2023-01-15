# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

levels = Level.all
levels.each do |level|
  Level.destroy(level.id) unless level.id == 1
end

Level.update(1,
  name: 'Level1（お試し）',
  level_image: '/images/level1_img.jpg'
)