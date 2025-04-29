# To Do's

## Important
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

### Server
- [x] Fix stability of reading/writing schema files (better front end validation might resolve this)
- [x] Update `.graphql` files (remove/change content)
- [x] Update the server to use the latest version of Node/Typescript etc. Remove unused dependancies (React)




---



## Nice to have's
- [ ] Setup Gihhub Workflows to automatically deploy to Dockerhub for both projects
- [ ] Deploy the service to Terraform?

### Editor
- [x] Setup a Provider for the App state logic - A lot could be moved out of the App component.
- [x] Setup React Query to handle calls to the server
- [ ] Move Faker definitions to the backend (either move validation logic to back end, or move validation logic to NPM package)
- [ ] Fix minor Editor issues:
    [x] - keyboard shortcuts aren't working (ctr+z, crt+s etc.)
	[ ] - autocomplete doesn't seem to use the option you selected in the tooltip - it just uses the first...
	[ ] - autocompletion doesn't seem to be showing up when it reaches the Type name (type ...), control and space works though...
	[ ] - autocompletion doesn't include extended types in the editor (nice to have, and probably fairly to resolve, but really not that important - when will this ever actually be used)? How to recreate - Create a type, then try and extend it and use autocompletion (tabbing)
- [ ] Re-add `OPEN_BROWSER` env var to open the Editor in teh browser at start up
- [ ] Prevent the GraphQL Playground from seeing the Fake definitons in the schema section (it's not clear if this is a bug that has been introduced, or if is is because we are using a newer version of graphiql) - Remove Faker types from schema before passing it to the GraphQL Playground (GraphiQL)
- [ ] Investigate adding request headers to Voyager via the browser (why isn't this currently possible in Voyager?) - Setup a conig section to add request headers for both the playground and voyager?


### Server
- [ ] Improve readabiity of fake definitions/schema logic.
- [ ] Move the validation logic (+ definitions/schema) logic to a npm package? So that both the server and editor can import it and it can be managed in one place.
- [ ] Share GraphQL volume with host computor
- [ ] Either move the `AUTH_TOKEN` logic out of this repository (as auth tokens should be coming from the front end) OR -  Setup a shared local `.headers.json` file where custom headers can be added, matching the back end... (It seems AUTH_TOKEN is currently required to handle authentication for Voyager -need to work out how to add it from the front end).
- [x] Set default PORT and SCHEMA_FILE_NAME values
- [ ] Share graphlql/.headers volume with host computure?
- [ ] Also allow custom headers to be passed in via env flag? (to match the functionality of the previous project)
- [ ] Add missing types! (update noImplicitAny to true in the tsconfig.js file). 

