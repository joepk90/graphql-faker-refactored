![GraphQL Faker logo](./docs/faker-logo-text.png)

# GraphQL Faker Refactored

This project is technically a refactor of the [https://github.com/graphql-kit/graphql-faker](github.com/graphql-kit/graphql-faker) project - The dependancies have been updated and the project modernised. React has been updated, as well as the Code Editor (Code Mirror).

The Back End Project can be found here:
[github.com/joepk90/graphql-faker-server](https://github.com/joepk90/graphql-faker-server) 

The Front End Project can be found here:
[github.com/joepk90/graphql-faker-editor](https://github.com/joepk90/graphql-faker-editor)

To contribute to the project, see the development guide [here](https://github.com/joepk90/graphql-faker-refactored/blob/main/development.md).


## Reasoning for the Refactor
The main reason for making this project was to change the functionality of extending Types.

In the original project, it was not possible override existing fields on existing Types, only add new fields to existing Types.

Looking at the existing project, it seemed to me there was a great deal of duplicated and unneccesary logic, especially around the options object which get passed around everywhere. In order to understand where this issue was occuring, understanding the project was required, which led to a refactor; seperating the Editor from the Server, removing the `options` config object and `cli` logic and opting for using a `.env` file and `docker-compose`.

It is now possible to override fields on existing types and return data specified in the schema editor, meanwhile any existing fields on the type that have not been overridden will continue to return real data as normal. To see this in action the following Schema override and Query can be used.

For this example the public `https://swapi-graphql.netlify.app` endpoint is being used, which has an existing `Film` type and `allFilms` Query which returns a list of films. In the example below, we are overriding the `Film` type, and define the the values of the film titles ourselves:

<b>Schema extension to add to the Editor:</b>
```
extend type Film {
  title: String @examples(values: [
    "The Terminator",
    "Terminator 2: Judgement Day",
    "Terminaator 3: Rise of the Machines"
  ])
  rating: Int @examples(values: [5, 4, 1])
}
```

<b>Query to use in the GraphQL Playground:</b>
```
query ExampleQuery {
  allFilms {
    films {
      title
      rating
      director
    }
  }
}
```

<b>This should then return a list of of filmes with overridden title fields and a rating field which originally did not exist:</b>
```
"films": [
        {
          "title": "Terminaator 3: Rise of the Machines",
          "rating": 5,
          "director": "George Lucas"
        },
        {
          "title": "The Terminator",
          "rating": 4,
          "director": "Irvin Kershner"
        },
        {
          "title": "Terminaator 3: Rise of the Machines",
          "rating": 5,
          "director": "Richard Marquand"
        },
        {
          "title": "The Terminator",
          "rating": 5,
          "director": "George Lucas"
        },
        {
          "title": "Terminator 2: Judgement Day",
          "rating": 1,
          "director": "George Lucas"
        },
        {
          "title": "Terminaator 3: Rise of the Machines",
          "rating": 1,
          "director": "George Lucas"
        }
      ]
```

# Original Documentation (with modifications)

Mock your future API or extend the existing API with realistic data from [faker.js](https://fakerjs.dev/). **No coding required**.
All you need is to write [GraphQL SDL](https://alligator.io/graphql/graphql-sdl/). Don't worry, we will provide you with examples in our SDL editor.

In the GIF below we add fields to types inside real GitHub API and you can make queries from GraphiQL, Apollo, Relay, etc. and receive **real data mixed with mock data.**
![demo-gif](./docs/demo.gif)

## How does it work?

We use `@fake` directive to let you specify how to fake data. And if 60+ fakers is not enough for you, just use `@examples` directive to provide examples. Use `@listLength` directive to specify number of returned array items. Add a directive to any field or custom scalar definition:

    type Person {
      name: String @fake(type: firstName)
      gender: String @examples(values: ["male", "female"])
      pets: [Pet] @listLength(min: 1, max: 10)
    }

No need to remember or read any docs. Autocompletion is included!

## Features

- 60+ different types of faked data e.g. `streetAddress`, `firstName`, `lastName`, `imageUrl`, `lorem`, `semver`
- Comes with multiple locales supported
- Runs as a local server (can be called from browser, cURL, your app, etc.)
- Interactive editor with autocompletion for directives with GraphiQL embedded
- ✨ Support for proxying existing GraphQL API and extending it with faked data
  ![Extend mode diagram](./docs/extend-mode.gif)

## Setup

Clone and run the project:
```
# clone the repository
git clone git@github.com:joepk90/graphql-faker-refactored.git

# move into the repository
cd graphql-faker-refactored

# move into the repository
cp .env.example .env

# start the service
make start
```

The configuration has now been moved to an `.env` file. This is true for this repository, which just includes a `docker-compose.yaml` file, and the front end and back end projects too.


### Options

| Option              | Description                                                                                     |
|---------------------|-------------------------------------------------------------------------------------------------|
| `ALLOWED_HOSTS`     | Hosts allowed to access the server (to manage CORS locally).                                    |
| `PORT`              | HTTP Port [default: `env.PORT` or `9002`].                                                     |
| `SCHEMA_FILE_NAME`  | Name of the Schema file you want to edit (TODO: these should be shared locally with the host computer). |
| `EXTEND_URL`        | URL to existing GraphQL server to extend.                                                      |
| `OPEN_BROWSER`      | Open the server (TODO: this feature should be changed to the front-end editor instead).         |
| `CUSTOM_HEADERS`    | Specify which headers should be forwarded to the proxied server (TODO: this should be changed to forward headers). |

This option has been removed but could be re-added:
- `-H`, `--header`: Specify headers to the proxied server in cURL format, e.g., `Authorization: bearer XXXXXXXXX`.
