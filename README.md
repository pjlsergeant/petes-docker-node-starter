# Setup

## First steps

Clear out git, and start your own:

```
rm -Rf .git && git init
```

Replace the sample project name with your own:

```perl -p -i -e 's/50a2fabfdd276f573ff97ace8b11c5f4/your-project-name/g' *```

## How node_modules works

We try and avoid local `node_modules` having anything in it, and have everything in the Docker image / Docker cache instead. The `package.json` and `package-lock.json` _are_ local. The build process will install required module on the Docker image in the directory above where the code is deployed.

To install a module:

`./docker-npm install module-name`

Note that this will write `package.json` and `package-lock.json`, but the installation itself won't happen until the next time you run a `docker-npm` command. If the module takes a long time to install, you'll actually need to wait for it twice, which sucks, but this seems like the least nasty way.

## `./docker-npm`

Runs `npm` in the Docker container. Note that:

* `./docker-npm shell` is a special command that gives you a shell in the container

* `./docker-npm install` is adding a bunch of extra flags to get it to not write installed data in the wrong place

