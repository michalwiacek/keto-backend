# ketowcy

next.js frontend and rails backend with graphql

~~### instalacja
```
docker-compose build
docker-compose run -u root backend bundle
docker-compose run frontend npm install
```

~~### stworzenie bazy danych w railsach:
z jakiegos powodu trzeba to zrobic tak (pozniej naprawie):
podlaczyc sie do basha w kontenerze:

`docker-compose run backend bash`

~~w srodku odpalic:

`rails db:create`

`exit`


~~### uruchomienie kontenerow
```
docker-compose up
```

~~frontend: http://localhost:3000

~~backend: http://localhost:8080
