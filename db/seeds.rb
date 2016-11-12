# populate countries
CS.countries.map { |country| Country.create(name: country[1]) }

# generate recipe ,video_id, description, public_id, country_id, short_description, cooking_time_min, calory

recipe = Recipe.create(video_id: "1478856605.035882999",
  description: Faker::Lorem.paragraph,
  country_id: 1,
  name: Faker::App.name,
  short_description: Faker::Lorem.sentence,
  cooking_time_min: rand(30),
  background_image: "http://res.cloudinary.com/dgwgbnszx/image/upload/v1478839280/3_aylfeg.jpg",
  calory: rand(5000))

4.times { Ingredient.create(name: Faker::App.name, recipe: recipe) }
4.times do |step|
  Instruction.create(title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    step: step,
    recipe: recipe)
end
