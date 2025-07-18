#!/usr/bin/env bash

# Set script to exit on error
set -e

echo "Current directory before any operations: $(pwd)"

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# Create the package.json file dynamically so pnpm does not pick it up when installing dependencies.
cat <<EOF > "$SCRIPT_DIR/package.json"
{
  "name": "@matterlabs/hardhat-zksync-upgradable",
  "version": "1.4.1",
  "description": "Hardhat plugin to deploy and update upgradable smart contracts for the ZKsync network",
  "repository": "github:matter-labs/hardhat-zksync",
  "homepage": "https://github.com/matter-labs/hardhat-zksync/tree/main/packages/hardhat-zksync-upgradable",
  "author": "Matter Labs",
  "license": "MIT",
  "main": "dist/src/index.js",
  "types": "dist/src/index.d.ts",
  "keywords": [
    "ethereum",
    "smart-contracts",
    "hardhat",
    "hardhat-plugin",
    "ZKsync"
  ],
  "scripts": {
    "lint": "pnpm eslint",
    "prettier:check": "pnpm prettier --check",
    "lint:fix": "pnpm eslint --fix",
    "fmt": "pnpm prettier --write",
    "eslint": "eslint 'src/**/*.ts' 'test/**/*.ts'",
    "prettier": "prettier 'src/**/*.ts' 'test/**/*.ts'",
    "test": "NODE_ENV=test c8 mocha test/**/*.ts  --no-timeout --exit",
    "build": "tsc --build .",
    "clean": "rimraf dist"
  },
  "files": [
    "dist/src/",
    "src/",
    "LICENSE",
    "README.md"
  ],
  "dependencies": {
    "@matterlabs/hardhat-zksync-deploy": "^1.7.0",
    "@matterlabs/hardhat-zksync-solc": "^1.4.0",
    "@matterlabs/hardhat-zksync-upgradable": "^1.9.0",
    "@openzeppelin/hardhat-upgrades": "^3.2.1",
    "chalk": "^4.1.2",
    "hardhat": "^2.22.5",
    "fs-extra": "^11.2.0",
    "ethereumjs-util": "^7.1.5",
    "ethers": "^6.12.2",
    "zksync-ethers": "^6.15.0",
    "solidity-ast": "^0.4.56",
    "proper-lockfile": "^4.1.2",
    "compare-versions": "^6.1.0"
  },
  "devDependencies": {
    "@openzeppelin/contracts": "^5.0.2",
    "@types/fs-extra": "^11.0.4",
    "@types/node": "^18.11.17",
    "@types/proper-lockfile": "^4.1.2",
    "@typescript-eslint/eslint-plugin": "^7.12.0",
    "@typescript-eslint/parser": "^7.12.0",
    "eslint": "^8.56.0",
    "eslint-config-prettier": "^9.1.0",
    "eslint-plugin-import": "^2.29.1",
    "eslint-plugin-no-only-tests": "^3.1.0",
    "eslint-plugin-prettier": "^5.0.1",
    "mocha": "^10.4.0",
    "prettier": "^3.3.0",
    "rimraf": "^5.0.7",
    "ts-node": "^10.9.2",
    "typescript": "^5.3.0",
    "c8": "^8.0.1"
  },
  "peerDependencies": {
    "@openzeppelin/contracts": "^5.0.2"
  },
  "prettier": {
    "tabWidth": 4,
    "printWidth": 120,
    "parser": "typescript",
    "singleQuote": true,
    "bracketSpacing": true
  }
}
EOF

echo "Pre-processing complete."
