# To Do's

## Important
- [ ] Document extending a Type from the https://swapi-graphql.netlify.app/graphql endpint
- [ ] Organise/Update Documentation
    - [ ] Move readme notes to this project + add documentation to a development.md file here
    - [ ] Review documentation in this file
    - [ ] Improve documentation on exentending/overrding types
    - [ ] Update repository names!
- [ ] Update `ENV VARS` to match existing setup - `FORWARD_HEADERS`/`CUSTOM_HEADERS` have been mixed up. Also `OPEN_BROWSER` opens the server, not the editor.




### Editor
- [x] Fix Editor bugs
        - Save Button (update the schema)
        - Errors
        - Unsaved Changes
        - Type hinting/autocompletion (prevent focus from moving outsite the editor when the tab button is pressed )
- [x] Fix Validation Issues
- [ ] Setup shared local `.headers.json` file where custom headers can be added
- [ ] Investigate adding request headers to Voyager via the browser (why isn't this possible?)
- [ ] Update GraphQL and Git icon links in front end (move git icon to the bottom)
- [ ] Test not using an extended schema...

### Server
- [ ] Fix stability of reading/writing schema files (better front end validation might resolve this)
- [ ] Update `.graphql` files (remove/change content)
- [ ] Share graphlql volume with host computure



---


## Nice to have's
- [ ] Setup Gihhub Workflows to automatically deploy to Dockerhub for both projects
- [ ] Setup a Dockerfile that runs both projects, so the service can be run without cloning the repo.

### Editor
- [ ] Setup a Provider for the App state logic - A lot could be moved out of the App component.
- [ ] Update the schema editor Theme! - the original theme was nicer
- [ ] Move Faker definitions to the backend (eitehr move validation logic to back end, or move validation logic to NPM package)
- [ ] Fix minor Editor issues:
    - keyboard shortcuts aren't working (ctr+z, crt+s etc.)
	- autocomplete doesn't seem to use the option you selected in the tooltip - it just uses the first...
	- autocompletion doesn't seem to be showing up when it reaches the Type name (type ...), control and space works though...
	- autocompletion doesn't include extended types in the editor (nice to have, and probably fairly to resolve, but really not that important - when will this ever actually be used)? How to recreate - Create a type, then try and extend it and use autocompletion (tabbing)


### Server
- [ ] Improve readabiity of fake definitions/schema logic.
- [ ] Move the validation logic (+ definitions/schema) logic to a npm package? So that both the server and editor can import it and it can be managed in one place.
- [ ] Share GraphQL volume with host computor
- [ ] Either move the `AUTH_TOKEN` logic out of this repository (as auth tokens should be coming from the front end) OR -  Setup a shared local `.headers.json` file where custom headers can be added, matching the back end... (It seems AUTH_TOKEN is currently required to handle authentication for Voyager -need to work out how to add it from the front end).
- [ ] Set default PORT and SCHEMA_FILE_NAME values