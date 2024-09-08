#!/bin/bash
## create next,js - decap cms site
##
# Create new directory and navigate into it
read -rep "$c2 repo-name: " "repo"; 
read -rep "$c2 create: " -i "$PWD/$repo" "mrepo"; 
##
mkdir -p -m 775 $mrepo; cd $mrepo; 
# Initialize a new project
npm init -y
# Install required dependencies
npm install --save react react-dom next
# Install webpack loader for Markdown (Use version 3+)
npm install --save-dev frontmatter-markdown-loader
# If using NextJS v11.0.0 or above, @babel/core and @babel/preset-react has to be installed as dependencies of frontmatter-markdown-loader
npm install --save-dev @babel/core @babel/preset-react
# Create folder for pages (default for NextJS), and add a index file
mkdir pages
touch pages/index.js
# Create a folder for content, and a markdown file:
mkdir content
touch content/home.md
# Create a folder for static assets
mkdir public
##
printf '
{
  "scripts": {
    "dev": "next",
    "build": "next build",
    "start": "next start",
    "export": "npm run build && next export"
  }
}
' >> ./package.json;
##
printf '
---
title: '$repo'
date: 2019-03-17T19:31:20.591Z
cats:
  - description: 'Maru is a Scottish Fold from Japan, and he loves boxes.'
    name: Maru (まる)
  - description: Lil Bub is an American celebrity cat known for her unique appearance.
    name: Lil Bub
  - description: 'Grumpy cat is an American celebrity cat known for her grumpy appearance.'
    name: Grumpy cat (Tardar Sauce)
---
Welcome to my awesome page about cats of the internet.

This page is built with NextJS, and content is managed in Decap CMS
' >> ./content.home.md;
##
printf '
module.exports = {
    webpack: (cfg) => {
        cfg.module.rules.push(
            {
                test: /\.md$/,
                loader: 'frontmatter-markdown-loader',
                options: { mode: ['react-component'] }
            }
        )
        return cfg
    }
}
' >> ./next.config.js;
##
printf '
import Head from "next/head"
import { Component } from 'react'
import { attributes, react as HomeContent } from '../content/home.md'

export default class Home extends Component {
  render() {
    let { title, cats } = attributes
    return (
      <>
        <Head>
          <script src="https://identity.netlify.com/v1/netlify-identity-widget.js"></script>
        </Head>
        <article>
          <h1>{title}</h1>
          <HomeContent />
          <ul>
            {cats.map((cat, k) => (
              <li key={k}>
                <h2>{cat.name}</h2>
                <p>{cat.description}</p>
              </li>
            ))}
          </ul>
        </article>
      </>
    )
  }
}
' >> ./pages/index.js; 
##
read -n1 -rep "$c2 test site? [Y/n]" "yno"; if [  "${yno}" != "n" ]; then 
npm run dev
fi; 
##
# Create and navigate into public/admin folder
mkdir -p ./public/admin
# Create index.html and config.yml file
##
printf '
<!doctype html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Content Manager</title>
  <script src="https://identity.netlify.com/v1/netlify-identity-widget.js"></script>
</head>
<body>
  <!-- Include the script that builds the page and powers Decap CMS -->
  <script src="https://unpkg.com/decap-cms@^3.0.0/dist/decap-cms.js"></script>
</body>
</html>
' >> ./public/admin/index.html;
##
printf '
backend:
  name: git-gateway
  branch: main # Branch to update (optional; defaults to master)
media_folder: public/img
public_folder: img
collections:
  - name: "pages"
    label: "Pages"
    files:
    - label: "Home"
      name: "home"
      file: "content/home.md"
      fields:
        - { label: "Title", name: "title", widget: "string"}
        - { label: "Publish Date", name: "date", widget: "datetime" }
        - { label: "Body", name: "body", widget: "markdown"}
        - label: 'Cats'
          name: "cats"
          widget: list
          fields:
            - { label: "Name", name: "name", widget: "string"}
            - { label: "Description", name: "description", widget: "text"}
' >> ./public/admin/config.yml; 
##
printf '
.next/
node_modules/
/npm-debug.log
.DS_Store
out/
' >> .gitignore;
