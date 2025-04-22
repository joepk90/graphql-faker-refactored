# To Do's



## Important
- [ ] Document extending a Type from the https://swapi-graphql.netlify.app/graphql endpint
- [ ] Update `ENV VARS` to match existing setup - `FORWARD_HEADERS`/`CUSTOM_HEADERS` have been mixed up. Also `OPEN_BROWSER` opens the server, not the editor.
- [ ] Organise/Update Documentation
    - [ ] Move readme notes to this project + add documentation to a development.md file here
    - [ ] Review documentation in this file
    - [ ] Improve documentation on exentending/overrding types
    - [ ] Update repository names!



### Editor
- [ ] Fix Editor bugs
        - Save Button (update the schema)
        - Errors
        - Unsaved Changes
        - Type hinting/autocompletion (prevent focus from moving outsite the editor when the tab button is pressed )
- [ ] Fix Validation Issues?
- [ ] Setup shared local `.headers.json` file where custom headers can be added
- [ ] Investigate adding request headers to Voyager via the browser (why isn't this possible?)

### Server
- [ ] Fix stability of reading/writing schema files (better front end validation migth resolve this)
- [ ] Update `.graphql` files (remove/change content)
- [ ] Share graphlql volume with host computure



---


## Nice to have's
- [ ] Setup Gihhub Workflows to automatically deploy to Dockerhub for both projects

### Editor
- [ ] Update the schema editor Theme! - the original theme was nicer
- [ ] Move Faker definitions to the backend (also move validation logic to back end if possible)

### Server
- [ ] Improve readabiity of fake definitions/schema logic
- [ ] Share GraphQL volume with host computor
- [ ] Either move the `AUTH_TOKEN` logic out of this repository (as auth tokens should be coming from the front end) OR -  Setup a shared local `.headers.json` file where custom headers can be added, matching the back end... (It seems AUTH_TOKEN is currently required to handle authentication for Voyager -need to work out how to add it from the front end).