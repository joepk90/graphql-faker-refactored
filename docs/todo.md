# To Do's

## Important
- [ ] Server: Update the dependancies? (express-graphql) [EST: 1D]
- [ ] Server: Add missing types! (update noImplicitAny to true in the tsconfig.js file). PR has been started... See branch: setup-types-for-faker-definitions
- [ ] Create a hard coded graphql user SDL file for the GCP PROD env showing the new override functionality?
-
- [ ] Reverse Port logic for both services? Make 8080 the default, but use the the default express/vite ports in DEV.
- [ ] Move Faker definitions to the backend (either move validation logic to back end, or move validation logic to NPM package)
- [ ] Graphql Faker Refactored in PROD (GCP) is currently unstable... Likely due to the the server consistently failing, but potentially a Proxy Server issue.
- [ ] Make Prod distributions work well (GraphQL Faker Refactored currently uses dev mode for PROD - This should be fixed)
    - This might be very easy to make work for the front end. The back end has issues though - the server inconsistently crashes. It's working at moment because it will crash and restart...


### Editor
- [ ] Fix minor Editor issues:
	[ ] - autocomplete doesn't seem to use the option you selected in the tooltip - it just uses the first...
	[ ] - autocompletion doesn't seem to be showing up when it reaches the Type name (type ...), control and space works though...
	[ ] - autocompletion doesn't include extended types in the editor (nice to have, and probably fairly to resolve, but really not that important - when will this ever actually be used)? How to recreate - Create a type, then try and extend it and use autocompletion (tabbing)
    [ ] - editor loses focus after user SDL is saved
- [ ] Re-add `OPEN_BROWSER` env var to open the Editor in teh browser at start up
- [ ] Prevent the GraphQL Playground from seeing the Fake definitons in the schema section (it's not clear if this is a bug that has been introduced, or if is is because we are using a newer version of graphiql) - Remove Faker types from schema before passing it to the GraphQL Playground (GraphiQL)
- [ ] Investigate adding request headers to Voyager via the browser (why isn't this currently possible in Voyager?) - Setup a conig section to add request headers for both the playground and voyager?
- [ ] Update VITE_APU_URL to API_URL? This might problematic with due to vite requirements - one option is use both? API_URL at runtime?
- [ ] Remove entrypoint.js setup? We are now using the entrypoint.sh bash script. Perhaps keep both but consider how this is organised?


### Server
- [ ] Share GraphQL volume with host computor
- [ ] Either move the `AUTH_TOKEN` logic out of this repository (as auth tokens should be coming from the front end) OR -  Setup a shared local `.headers.json` file where custom headers can be added, matching the back end... (It seems AUTH_TOKEN is currently required to handle authentication for Voyager -need to work out how to add it from the front end).
- [ ] Share graphlql/.headers volume with host computure?
- [ ] Also allow custom headers to be passed in via env flag? (to match the functionality of the previous project)

