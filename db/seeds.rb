# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create(name: "Marc", password: "password", email: "russo@test.com")
user2 = User.create(name: "Sammy", password: "password", email: "sam@test.com")

post = Post.create(title: "Lemon in your water?", content: "I recently read an article about lemon in your water. This is not a new thing by any means. People have been doing it for decades. My dad used to squeeze lime into his water in the morning to lose some weight. But I discovered that lemon and lime in your water is more than just a way of dropping a few pounds. In fact, squeezing a lemon into your glass of water has other benefits. One of them is boost your body's immune system. Lemon has many vitamins and minerals that support our immuned system. Another things is, that the first hing in the morning is when we are the most dehydrated. Lemon helps prevent dehydration. It is very important to really commit to drink ar least 8 oz of water when you first get up in the morning so our body can function properly.", user_id: user1.id)
Post.create(title: "Food and Anxiety", content: "Certain foods can contribute to anxiety or trigger such feelings by producing blood sugar spikes, says Maggie Michalczyk, a registered dietitian based in Chicago. Cakes, cookies, candy, pies, soda pop and other sugary foods can lead to such blood spikes. Say what?? Cake and cookies?? But why, how? Highly processed foods like breads, cakes, processed meats, cheese and ready-made meals invoke anxiety by increasing inflammation in the body.  These foods are low in fiber and are thought to disturb the normal gut microbiome. In a world full of anxiety triggers, most of which are out of our control, we can make a decision on what foods to eat to lower our anxiety levels.", user_id: user2.id)

recipe = Recipe.create(name: "Smoothie", ingredients: "frosen banana, strawberry, protein, almond milk", instructions: "Blend it all up and pour into glass. If using frozen fruit and depending on concistency, pour into bowl", cook_time: "2 minutes", user_id: user1.id)
Recipe.create(name: "Swett Bread", ingredients: "4 cups flour, 1/2 cup sugar, 2 1/2 tsp dry yeast, 1 eggs, 1 1/4 cup milk, 2 tbsp butter", instructions: "Mix all dry ingredients and add wet ingredients slowly and mix. Knead dough for a least 5 minutes. Let it rise for about 1 hour. Roll the dough and form into the shape you want. Bake for 30 minutes.", cook_time: "30 min", user_id: user2.id)