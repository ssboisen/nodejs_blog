config = require './config'
collections = ['posts']
db = require('mongojs').connect "#{config.db.username}:#{config.db.password}@#{config.db.host}:#{config.db.port}/#{config.db.name}", collections

sleep = (milliSeconds) ->
    startTime = new Date().getTime()
    while new Date().getTime() < (startTime + milliSeconds) then

db.posts.remove()

db.posts.insert { 
  title: "Blog post title",
  body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
  post_date: new Date() }
