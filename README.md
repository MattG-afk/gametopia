### Gametopia

## Description

Gametopia is a app that keeps track and lists out your video games, so you don't buy a duplicate game.

## User-Functionality 

Users can sign up, login, create posts, edit/and or delete those posts.

When creating a post Users have full functionallity when entering into the allocated fields.

## Install

Download and clone this repo then run

$ bundle Install

Load db if needed

$ rake db:schema:load 

Run a local server via

$ shotgun
$ view local server in browser with (localhost:9393) or use port that console shows

If you want to test out stuff in a console 

$ rake console

## Gems_Used

"activerecord", "~> 6.0"

*'sinatra', '~> 2.0', '>= 2.0.8.1'
"sinatra-activerecord", "~> 2.0"

"pry", "~> 0.13.1"

"shotgun", "~> 0.9.2"

"require_all", "~> 3.0"

"sqlite3", "~> 1.4"

'bcrypt', '~> 3.1.7'

'rake'

'tux', '~> 0.3.0'

'rack', '~> 2.2', '>= 2.2.3'

## Later Improvements

Feature that will be added in the future 

User can see other profile 

User can make friends via matching game recommendations 

More HTML and CSS 
