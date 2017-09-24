#!/bin/bash -e

alias yarn='yarn --emoji'
alias ya='yarn --emoji'
alias jsProject='javascriptProject;'
javascriptProject () {
  TAB="  "
  mkdir -p "$1"
  cd "$1" || return
  ya init -y
  ya add mocha chai standard
  ya add babel-core babel-preset-es2015 --dev
  cp "$DOTFILES_LOCATION/config/vim/tern-project" ./.tern-project
  jq -r '.scripts |= . + {"start": "node src/index.js", "test": "mocha ./src/**.test.js --compilers js:babel-core/register"}' package.json > temp.json
  jq -r '.standard |= . + {}' temp.json > package.json
  jq -r '.standard.globals |= . + ["after", "afterEach", "before", "beforeEach", "describe", "context", "it"]' package.json > temp.json
  mv temp.json package.json
  mkdir -p src
  touch src/index.js
  echo -e "{\n$TAB\"presets\": [\"es2015\"]\n}" > .babelrc
  local IMPORT="import { expect } from 'chai'"
  local IT="${TAB}it('Tests something', () => {\n$TAB${TAB}expect(1).to.be.eql(1)\n$TAB})"
  local DESCRIBE="describe('A test', () => {\n$IT\n})"
  local TEST="$IMPORT\n\n$DESCRIBE"
  echo -e "$TEST" > src/intext.test.js
  ya
}

nUse() {
  if [ -e package.json ]; then
    sudo n $(cat package.json | jq .engines.node -r)
  else
    echo "No package.json found"
  fi
}

nScripts() {
  if [ -e package.json ]; then
    cat package.json | jq .scripts
  else
    echo "No package.json found"
  fi
}

nDependencies() {
  if [ -e package.json ]; then
    cat package.json | jq .dependencies
  else
    echo "No package.json found"
  fi
}

nDevDependencies() {
  if [ -e package.json ]; then
    cat package.json | jq .devDependencies
  else
    echo "No package.json found"
  fi
}

nb () {
  "$(npm bin)/$1"
}