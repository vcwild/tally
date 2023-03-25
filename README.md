<p align="center">
    <img src=".github/tally.svg" width="200px" />
    <br/>
    <br/>
    <img src="https://img.shields.io/github/languages/count/vcwild/tally?color=%23FBC86D&style=flat-square" alt="languages" />
    <img src="https://img.shields.io/github/license/vcwild/tally?color=%23FBC86D&style=flat-square" alt="license" />
    <img src="https://img.shields.io/github/repo-size/vcwild/tally?color=%23FBC86D&style=flat-square" alt="repo size" />
</p>

# Tally

Tally is an application for restaurant inventory management. It is a mailing system that warns restaurant managers when a resource due date is about to expire. Created with [Phoenix](https://hexdocs.pm/phoenix/Mix.Tasks.Phx.New.html), [Ecto](https://hexdocs.pm/ecto/), and a dockerized [Postgres](https://www.postgresql.org/) database.

## Table of Contents

- [API Methods](#API-Methods)
- [API Endpoints](#API-Endpoints)
- [Project Requirements](#Project-Requirements)
- [License](#License)

## API Methods

- [Restaurant creation](#creation)
- [Supply creation](#supplies)
- [Show supplies](#show_supplies)

## Mailing

- Uses [bamboo](https://github.com/thoughtbot/bamboo) server as mailing framework

## API Endpoints

### Scope `/api`

#### Endpoint `/restaurants` <a name="creation" />

Description: create an user with an unique UUID.

Params:

`name`: a string with the user name

`email`: a valid e-mail account

Methods: 

- POST

Body: 

```json
 {
    "name": String,
    "email": email@email.com,
}
```

#### Endpoint `/supplies` <a name="supplies" />

Description: create a supply for the restaurant with an unique UUID.

Params:

`restaurant_id`: Restaurant Unique UUID

`description`: Supply description

`expiration_date`: Supply expiration date

`in_charge`: Person in charge of the supply

Methods: 

- POST

Body: 

```json
 {
    "restaurant_id": String,
    "description": String,
    "expiration_date": String format YYYY-MM-DD,
    "in_charge": String
}
```

#### Endpoint `/supplies/:id` <a name="show_supplies" />

Description: Get supply.

Response:

```json
{
  "supply": {
    "description": "batata",
    "expiration_date": "2021-04-01",
    "in_charge": "potato guy",
    "restaurant_id": "88f4b2c8-b09f-4168-8fbd-559988ebb106",
    "id": "a4b47172-2e07-4cbc-b3bf-96bedd6a700b"
  }
}
```

## Project Requirements

- [Mix requirements](./mix.exs)
- [Docker](https://www.docker.com/)
- [Docker compose](https://docs.docker.com/compose/)
- [Postgres database](https://hub.docker.com/_/postgres)

### Create Docker-Compose image from Docker Hub

```sh
docker-compose up -d
```

### Install Phoenix from Mix archive

```sh
mix archive.install hex phx_new 1.5.7\
```

## License
Distributed under the GPL 3. License. See [LICENSE](/LICENSE) for more information.
