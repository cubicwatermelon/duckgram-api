# README

Ruby version: 2.4.0

| Método | URL | Função |
| ------ | ------ | ------ |
| `GET`    | `localhost:3000/users`                             | Retornar todos os usuários |
| `GET`    | `localhost:3000/users/:user_code`                  | Retorna dados do usuário |
| `POST`   | `localhost:3000/users`                             | Cria novo usuário |
| `PUT`    | `localhost:3000/users/:user_code`                  | Atualiza usuário |
| `DELETE` | `localhost:3000/users/:user_code`                  | Remove usuário |
| `GET`    | `localhost:3000/users/:user_code/notifications`    | Retornar notificações do usuário |
| `GET`    | `localhost:3000/users/:user_code/feed`             | Retornar posts dos usuários que o usuário atual segue |
| `GET`    | `localhost:3000/users/:user_code/following`        | Retornar todos os usuários que o usuário segue |
| `GET`    | `localhost:3000/users/:user_code/followers`        | Retornar todos os seguidores do usuário |
| `POST`   | `localhost:3000/users/:user_code/follow`           | Usuário ativo segue o usuário |
| `DELETE` | `localhost:3000/users/:user_code/unfollow`         | Usuário ativo deixa de seguir o usuário |
| `GET`    | `localhost:3000/users/:user_code/posts`            | Retornar todos os posts do usuário |
| `GET`    | `localhost:3000/users/:user_code/posts/:post_code` | Retorna dados do post do usuário |
| `POST`   | `localhost:3000/users/:user_code/posts`            | Cria novo post do usuário |
| `PUT`    | `localhost:3000/users/:user_code/posts/:post_code` | Atualiza post do usuário |
| `DELETE` | `localhost:3000/users/:user_code/posts/:post_code` | Remove post do usuário |