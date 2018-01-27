felipe  = User.create(name: 'Felipe Mengatto', email: 'felipemengatto@gmail.com', password: '1234', avatar: Faker::Avatar.image)
kaciano = User.create(name: 'Kaciano Ghelere', email: 'kacianoghelere@gmail.com', password: '1234', avatar: Faker::Avatar.image)
pedro   = User.create(name: 'Pedro Rostirolla', email: 'pedrorostirolla@gmail.com', password: '1234', avatar: Faker::Avatar.image)
douglas = User.create(name: 'Douglas Peretti', email: 'douglasperetti@gmail.com', password: '1234', avatar: Faker::Avatar.image)
marlon  = User.create(name: 'Marlon Rettore', email: 'marlonrettore@gmail.com', password: '1234', avatar: Faker::Avatar.image)
andrey  = User.create(name: 'Andrey Wilson Alberti', email: 'andreyalberti@gmail.com', password: '1234', avatar: Faker::Avatar.image)

felipe.follow(kaciano)
felipe.follow(pedro)
felipe.follow(douglas)
felipe.follow(marlon)
felipe.follow(andrey)

kaciano.follow(felipe)
kaciano.follow(pedro)
kaciano.follow(douglas)
kaciano.follow(marlon)
kaciano.follow(andrey)

pedro.follow(kaciano)
pedro.follow(douglas)
pedro.follow(felipe)

douglas.follow(kaciano)
douglas.follow(pedro)

marlon.follow(kaciano)
marlon.follow(felipe)
marlon.follow(andrey)

andrey.follow(kaciano)
andrey.follow(felipe)
andrey.follow(marlon)
andrey.follow(pedro)

users = User.all
users.each do |user|
    post_amount = rand(3..10)
    post_amount.times do |n|
        Faker::Lorem.sentence(5)
        user.posts.create({
            picture: Faker::Avatar.image,
            description: Faker::Lorem.sentence(5)
        })
    end
end

# users.each do |user|
#     like_amount = rand(1..5)
#     like_amount.times do |n|
#         posts = Post.all
#         post = posts.take
#         if user.id != post.user.id
#             user.like(post)
#         end
#     end
# end