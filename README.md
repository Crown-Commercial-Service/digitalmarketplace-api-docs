# Digital Marketplace API docs

This is a template based on https://github.com/alphagov/tech-docs-template
for publishing the OpenAPI specification for https://github.com/alphagov/digitalmarketplace-api
as HTML website.

## Getting started

Set up requires Ruby and node.js.
In the repo folder type the following to install the requrements:

```
make requirements
```

## Build

Type the following to build the HTML:

```
make html API_SPEC=<path/to/openapi.yaml>
```

This will create a `build` subfolder in the application folder which contains
the HTML and asset files ready to be published. If `make requirements` has been
run the `build/` folder will be a worktree for the `gh-pages` branch.

## Preview

Whilst writing documentation we can run a middleman server to preview how the
published version will look in the browser.

Type the following to start the server:

```
make server
```

Note: in order to preview the changes made to the OpenAPI spec you need to rerun
`make html`.

## Publish

To rebuild and push the new version of documentation to Github Pages run

```
make publish API_SPEC=<path/to/openapi.yaml>
```
