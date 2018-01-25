jesus = User.create(name: 'Jesus', email: 'jesus@holy.com', password: '123456', avatar: 'jesusphoto')
judas = User.create(name: 'Judas', email: 'judas@holy.com', password: '123456', avatar: 'judasphoto')
pedro = User.create(name: 'Pedro', email: 'pedro@holy.com', password: '123456', avatar: 'pedrophoto')

jesus.posts.create(picture: 'wine_from_water', description: 'My first miracle')
jesus.posts.create(picture: 'shadow_fish_clone_technique', description: 'My second miracle')
jesus.posts.create(picture: 'me_in_the_cross_chilling', description: 'My third miracle')

judas.posts.create(picture: 'i_love_jesus', description: 'Our first')
judas.posts.create(picture: 'i_love_money', description: 'Our last kiss')

pedro.posts.create(picture: 'first_lie', description: 'I don\' know any Jesus guy')
pedro.posts.create(picture: 'second_lie', description: 'I don\' know any Jesus guy')
pedro.posts.create(picture: 'third_lie', description: 'I don\' know any Jesus guy')
pedro.posts.create(picture: 'the_truth', description: 'Jesus? Yes yes, now i\'m remembering that guy')