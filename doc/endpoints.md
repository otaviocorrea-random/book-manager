- Url base para teste => https://otabook.herokuapp.com/api

- 🔒 => Requer headers de autenticação

# Autenticação
<details> 
  <summary>Login</summary>

  `POST` => `/auth/sign_in`

  headers:
  ```text
  Content-Type: application/json
  ```
  body:
  ```json
  {
    "email": "email@gmail.com",  //required
    "password": "senha"  //required
  }
  ```
  retorno esperado:
  ```json
  {
    "data": {
      "email": "email@gmail.com",
      "provider": "email",
      "uid": "email@gmail.com",
      "id": 1,
      "name": "Testinho da Silva",
      "allow_password_change": false
    }
  }
  ```
  Nos headers desta requisição, você deve armazenar as 3 propriedades encessárias para autenticar nos outros endpoints.
  - Access-Token
  - Uid: `Geralmente é igual ao email, mas pode ser capturado nos headers do login`
  - Client
  
  > Estes valores devem ser repassados nos headers de todas as requisições que necessitam de autenticação.
  >> **A api aceita receber estes header como case incensitive
</details>

<details> 
  <summary>Logout 🔒</summary>

  `DELETE` => `/auth/sign_out`
  
  headers:
  ```text
  access_token: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  uid: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  client: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  ```
  ** sem body **
</details>

<details> 
  <summary>Validar sessão 🔒</summary>

  `GET` => `/auth/validate_token`
  
  headers:
  ```text
  access_token: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  uid: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  client: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  ```
  ** sem body **

  retorno esperado:
  ```json
  {
    "data": {
      "email": "email@gmail.com",
      "provider": "email",
      "uid": "email@gmail.com",
      "id": 1,
      "name": "Testinho da Silva",
      "allow_password_change": false
    }
  }
  ```
</details>

# Usuario
<details> 
  <summary>Cadastro 🔒</summary>

  `POST` => `/user`

  headers:
  ```text
  Content-Type: application/json
  ```
  body:
  ```json
  {
    "name": "Testinho da Silva", //required
    "email": "email@gmail.com",  //required
    "password": "senha",  //required
    "password_confirmation": "senha"  //required
  }
  ```
  retorno esperado:
  ```json
  {
    "data": {
      "user": {
        "id": 1,
        "name": "Testinho da Silva",
        "email": "email@gmail.com",
        "created_at": "2022-04-29T04:07:29.287Z",
        "updated_at": "2022-04-29T04:07:29.287Z",
        "provider": "email",
        "uid": "email@gmail.com",
        "allow_password_change": false
      },
      "books": []
    }
  }
  ```
</details>

<details> 
  <summary>Perfil completo 🔒</summary>

  `GET` => `/user`
  
  headers:
  ```text
  access_token: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  uid: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  client: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  ```
  ** sem body **

  retorno esperado:
  ```json
  {
    "data": {
      "user": {
        "id": 1,
        "name": "Testinho da Silva",
        "email": "email@gmail.com",
        "created_at": "2022-04-29T04:07:29.287Z",
        "updated_at": "2022-04-29T04:07:29.287Z",
        "provider": "email",
        "uid": "email@gmail.com",
        "allow_password_change": false
      },
      "books": []
    }
  }
  ```
</details>


<details> 
  <summary>Remover usuário 🔒</summary>

  `DELETE` => `/user`
    
  headers:
  ```text
  access_token: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  uid: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  client: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  ```
  ** sem body **
</details>

<details> 
  <summary>Atualizar dados 🔒</summary>

  `POST` => `/user`

  headers:
  ```text
  Content-Type: application/json
  access_token: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  uid: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  client: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  ```
  body:
  ```json
  {
    "name": "Testinho da Silva Jr.", //opcional
    "email": "email@gmail.com"  //opcional -> se atualizado, encerra a sessão
  }
  ```

  retorno esperado:
  ```json
  {
    "data": {
      "user": {
        "id": 1,
        "name": "Testinho da Silva Jr.",
        "email": "email@gmail.com",
        "created_at": "2022-04-29T04:07:29.287Z",
        "updated_at": "2022-04-29T04:07:29.287Z",
        "provider": "email",
        "uid": "email@gmail.com",
        "allow_password_change": false
      },
      "books": [] // Caso tenha feito reviews, serão exibidos aqui
    }
  }
  ```
</details>

<details> 
  <summary>Atualizar senha 🔒</summary>
  
  `PUT` => `/auth`

  headers:
  ```text
  Content-Type: application/json
  access_token: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  uid: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  client: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  ```
  body:
  ```json
  {
    "password": "novaSenha", //required
    "confirmation_password": "novaSenha" //required
  }
  ```
</details>

# Livros

<details> 
  <summary>Cadastrar livro 🔒</summary>

  `POST` => `/books`

  headers:
  ```text
  Content-Type: application/json
  access_token: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  uid: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  client: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  ```

  body:
  ```json
  {
    "title": "Batatas Assassinas", //required
    "author": "Patati", //required
    "genre": "food" //required
  }
  ```
  retorno esperado:
  ```json
  {
    "data": {
      "book": {
        "id": 1,
        "title": "Batatas Assassinas",
        "author": "Patati",
        "genre": "food",
        "created_at": "2022-04-29T04:09:17.657Z",
        "updated_at": "2022-04-29T04:09:17.657Z"
      },
      "ratings": []
    }
  }
  ```
</details>

<details> 
  <summary>Editar Livro 🔒</summary>

  `PUT` => `/books/{{livro_id}}`

  headers:
  ```text
  Content-Type: application/json
  access_token: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  uid: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  client: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  ```

  body:
  ```json
  {
    "title": "Batatas Assassinas - A revolta de Jedi", //opcional
    "author": "Patati & Patata", //opcional
    "genre": "food" //opcional
  }
  ```
  retorno esperado:
  ```json
  {
    "data": {
      "book": {
        "id": 1,
        "title": "Batatas Assassinas - A revolta de Jedi",
        "author": "Patati & Patata",
        "genre": "food",
        "created_at": "2022-04-29T04:09:17.657Z",
        "updated_at": "2022-04-29T04:09:18.657Z"
      },
      "ratings": []
    }
  }
  ```
</details>

<details> 
  <summary>Pesquisar livros 🔒</summary>

  `GET` => `/books`

  headers:
  ```text
  access_token: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  uid: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  client: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  ```
  url parameters:
  - title: Titulo do livo => ex: url/books?genre=Batata
  - author: Author do livo => ex: url/books?author=food
  - genre: Genero do livo => ex: url/books?genre=food
  > Pode passar todos de uma vez e em qualquer ordem
  >
  > Ex => url/books?author=pata&genre=foo&title=bat


  ** sem body **

  retorno esperado:
  ```json
  {
    "data": {
      "user": {
        "id": 1,
        "name": "Testinho da Silva",
        "email": "email@gmail.com",
        "created_at": "2022-04-29T04:07:29.287Z",
        "updated_at": "2022-04-29T04:07:29.287Z",
        "provider": "email",
        "uid": "email@gmail.com",
        "allow_password_change": false
      },
      "books": [] // Caso tenha feito reviews, serão exibidos aqui
    }
  }
  ```
</details>

<details> 
  <summary>Exibir dados do livro 🔒</summary>

   `GET` => `/books/{{livro_id}}`
  headers:
  ```text
  access_token: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  uid: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  client: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  ```
  ** sem body **

  retorno esperado:
  ```json
  {
    "data": {
      "book": {
        "id": 1,
        "title": "Batatas Assassinas - A revolta de Jedi",
        "author": "Patati & Patata",
        "genre": "food",
        "created_at": "2022-04-29T04:09:17.657Z",
        "updated_at": "2022-04-29T04:09:18.657Z"
      },
      "ratings": []
    }
  }
  ```

</details>
 
<details> 
  <summary>Deletar livro 🔒</summary>

  `DELETE` => `/books/{{livro_id}}`

  headers:
  ```text
  access_token: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  uid: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  client: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  ```
  ** sem body **
  > NÃO É POSSIVEL REMOVER LIVROS QUE TENHAM REVIEWS
</details>

<details> 
  <summary>Adicionar ou editar review 🔒</summary>

  `POST` => `/books/{{livro_id}}/create_or_update_rating`

  É possivel apenas um review por livro, caso queira editar o review, basta repetir a solicitação passando os novos dados

  headers:
  ```text
  Content-Type: application/json
  access_token: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  uid: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  client: 'TOKEN_GERADO_NO_HEADER_LOGIN'
  ```

  body:
  ```json
  {
    "read": "false", //opcional => 1 ou 0 / "true" ou "false
    "rating": 9, //opcional => 1 <-> 10
    "review": "Maravilhoso!" //opcional
  }
  ```
  retorno esperado:
  ```json
  {
    "data": {
      "rating": {
        "id": 1,
        "user_id": 1,
        "book_id": 1,
        "rating": 9,
        "review": "Maravilhoso!",
        "read": false,
        "created_at": "2022-04-29T04:09:34.130Z",
        "updated_at": "2022-04-29T04:09:34.130Z"
      }
    }
  }
  ```
</details>
