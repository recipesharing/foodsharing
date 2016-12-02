# populate countries
seasons = %w(fall spring summer winter)
cuisine = %w(african american asian british\
             chinese vietnamese japanese korean indian)
main_ingredient = %w(beef fish lamb pork poultry shelfish vegetarian)
seasons.each do |season|
  Season.create(name: season)
end

cuisine.each do |c|
  Country.create(name: c)
end

main_ingredient.each do |ingredient|
  MainIngredient.create(name: ingredient)
end

prices = [50_000, 100_000, 150_000]

20.times do
  recipe = Recipe.create(
    video_id: 'v1480418558/18346bdb0e5f98080a955b028903aa3f79b4d6e7.mp4',
    background_name: '3_aylfeg.jpg',
    country: Country.find(rand(1..Country.count)),
    season: Season.find(rand(1..Season.count)),
    main_ingredient: MainIngredient.find(rand(1..MainIngredient.count)),
    description: Faker::Lorem.paragraph,
    name: Faker::App.name,
    short_description: Faker::Lorem.sentence(2),
    cooking_time_min: rand(30),
    background_image: 'http://res.cloudinary.com/dgwgbnszx/image/upload/v1478839280/3_aylfeg.jpg',
    calory: rand(3..5) * 100,
    unit_price: prices[rand(3)]
  ) if Recipe.count < 10

  4.times { Ingredient.create(name: Faker::App.name, recipe: recipe) }

  description_steps = [
    'Roast the beet & carrots',
    'Place the beet and carrots on a sheet pan',
    'Drizzle with olive oil',
    'season with salt',
    'pepper and half the thyme',
    'Toss to thoroughly coat',
    'Arrange in a single',
    'layer and roast',
    'stirring halfway through',
    'tender when pierced with a fork',
    'Remove from the oven'
  ]
  count_description_steps = description_steps.count
  4.times do |step|
    Instruction.create(
      # title: Faker::Lorem.sentence,
      title: description_steps[rand(count_description_steps)],
      image_url: 'http://res.cloudinary.com/dgwgbnszx/image/upload/c_mfit,h_380,w_500/v1478839280/3_aylfeg.jpg',
      content: Faker::Lorem.paragraph,
      step: step,
      recipe: recipe
    )
  end
end

### gonna change background image
background_url = %w(
  http://res.cloudinary.com/dgwgbnszx/image/upload/v1480424248/back1.jpg
  http://res.cloudinary.com/dgwgbnszx/image/upload/v1480424248/back2.jpg
  http://res.cloudinary.com/dgwgbnszx/image/upload/v1480424248/back3.jpg
  http://res.cloudinary.com/dgwgbnszx/image/upload/v1480424248/back4.jpg
  http://res.cloudinary.com/dgwgbnszx/image/upload/v1480424248/back5.jpg
  http://res.cloudinary.com/dgwgbnszx/image/upload/v1480424248/back6.jpg
)

background_name_ls = %w(back1.jpg back2.jpg\
                        back3.jpg back4.jpg back5.jpg back6.jpg)

food_names =
  ['Simmered Basil & Lime Pork',
   'Basted Tomatos & Pigeon',
   'Broasted Garlic & Onion Herring',
   'Dry-Roasted Curry of Crab',
   'Brined Savory Pasta',
   'Oven-Grilled Beets & Orange Walnuts',
   'Peanut and Almond Doughnut',
   'Saffron and Red Wine Tart',
   'Apple Tarte Tatin',
   'Papaya Roll']

ingredient_names = 
 ['Bacon',
  'Beef fat',
  'Butter',
  'Chicken fat',
  'Cocoa butter',
  'Coconut or coconut oil',
  'Hydrogenated fats and oils',
  'Lard',
  'Palm or palm kernel oil',
  'Powdered whole milk solids',
  'Shortening',
  'Suet',
  'Tallow',
  'Baking powder',
  'Baking soda',
  'Brine',
  'Celery salt',
  'Disodium phosphate',
  'Garlic salt',
  'Monosodium glutamate (MSG)',
  'Onion salt',
  'Salt',
  'Sodium alginate',
  'Sodium benzoate',
  'Sodium bisulfate',
  'Sodium proprionate',
  'Soy sauce']

Recipe.all.each do |r|
  count = ingredient_names.count
  i = rand(5)
  r.background_name = background_name_ls[i]
  r.background_image = background_url[i]
  r.name = food_names[rand(9)]
  r.ingredient_list << ingredient_names[rand(count - 3), rand(3)]
  r.save
end

