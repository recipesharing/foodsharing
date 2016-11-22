# populate countries
CS.countries.map { |country| Country.create(name: country[1]) }

# generate recipe ,video_id, description, public_id, country_id, short_description, cooking_time_min, calory
seasons = %w[fall spring summer winter]
cuisine = %w[african american asian british chinese vietnamese japanese korean indian]
main_ingredient = %w[beef fish lamb pork poultry shelfish vegetarian]
seasons.each do |season|
  Season.create(name: season)
end

cuisine.each do |c|
  Country.create(name: c)
end

main_ingredient.each do |ingredient|
  MainIngredient.create(name: ingredient)
end

recipe = Recipe.create(video_id: "1478856605.035882999",
  country: Country.find(rand(Country.count)),
  season: Season.find(rand(Season.count)),
  main_ingredient: MainIngredient.find(rand(MainIngredient.count)),
  description: Faker::Lorem.paragraph,
  name: Faker::App.name,
  short_description: Faker::Lorem.sentence,
  cooking_time_min: rand(30),
  background_image: "http://res.cloudinary.com/dgwgbnszx/image/upload/v1478839280/3_aylfeg.jpg",
  calory: rand(5000))

4.times { Ingredient.create(name: Faker::App.name, recipe: recipe) }
4.times do |step|
  Instruction.create(title: Faker::Lorem.sentence,
    image_url: 'http://res.cloudinary.com/dgwgbnszx/image/upload/c_mfit,h_380,w_500/v1478839280/3_aylfeg.jpg',
    content: Faker::Lorem.paragraph,
    step: step,
    recipe: recipe)
end
