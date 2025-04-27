# Custom Headers
A `headers.json` file can be used to set custom headers which get passed on to the graphql requests, either through Voyager or the GraphQL Playground.

To enable this feature, set the `CUSTOM HEADERS` environment variable to `TRUE` in the `.env` file, and create a  `headers.json` file in this directory with the required headers:
```
cp .headers/.headers.example.json .headers/.headers.json 
```

The custom headers `headers.json` file has been added here to keep it out of the way. Ideally, it would be possible to easily add custom request headers in the Editor (React App), but this is a simpler approach for now.