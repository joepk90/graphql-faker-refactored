# To Do's
- [x] Document extending a Type from the https://swapi-graphql.netlify.app/graphql endpint
- [x] Organise/Update Documentation
    - [x] Move readme notes to this project + add documentation to a development.md file here
    - [x] Review documentation in the readme file
    - [x] Improve documentation on exentending/overrding types
    - [x] Update repository names!
- [x] Update `ENV VARS` to match existing setup - `FORWARD_HEADERS`/`CUSTOM_HEADERS` have been mixed up. Also `OPEN_BROWSER` opens the server, not the editor.
- [x] Setup shared local `.headers.json` file where custom headers can be added (make graphql voyager work with protected gql)
- [x] Note to previous creators - if want me to add anything back let me know...
- [x] Setup a Dockerfile that runs both projects, so the service can be run without cloning the repo.
- [x] Setup GihHub Workflows to automatically deploy to Dockerhub for both projects
- [x] Deploy the service to Terraform?
- [x] Finish Serverless App CI Workflows updates/documentation!
- [x] Make graphql-faker projects work when using UW
    - [x] Fix CORS version of Graphql Faker! Make it work with UW Graphql AND the open graphql URL.
    - [x] Make graphql-faker-refactors work in GCP (Check Filmons UW setup!)
- [x] Make PORTS dynamic for both server and client.


### Editor
- [x] Fix Editor bugs
        - Save Button (update the schema)
        - Errors
        - Unsaved Changes
        - Type hinting/autocompletion (prevent focus from moving outsite the editor when the tab button is pressed )
- [x] Fix Validation Issues
- [x] Update GraphQL and Git icon links in front end (move git icon to the bottom)
- [x] Test not using an extended schema...
- [x] Prevent having to reload the page in order to make the updated schema to appear in the GraphQL Playground. (Refetch the schema once a custom schema has been saved)
- [x] Fix front end bug - ctr+s can cause the text editor to empty if used to early 
- [x] Update Editor Port to 5173 (default vite port)
- [x] Setup a Provider for the App state logic - A lot could be moved out of the App component.
- [x] Setup React Query to handle calls to the server
- [x] Fix keyboard shortcuts in Schema Editor (ctr+z, crt+s etc.)

### Server
- [x] Update Server Port to 3000 (default express port)
- [x] Fix stability of reading/writing schema files (better front end validation might resolve this)
- [x] Update `.graphql` files (remove/change content)
- [x] Update the server to use the latest version of Node/Typescript etc. Remove unused dependancies (React)
- [x] Set default PORT and SCHEMA_FILE_NAME values
