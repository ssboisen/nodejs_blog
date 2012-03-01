config = require '../config'
collections = ['posts']
connection_string = "#{config.db.username}:#{config.db.password}@#{config.db.host}:#{config.db.port}/#{config.db.name}"

db = require('mongojs').connect connection_string, collections
 
findOne = (collection, sort, callback) ->
  collection.find().sort(sort).limit(1).next(callback)

latest_post = {}

findOne(db.posts, { post_date: -1 }, (err, doc) ->
  latest_post = doc unless !doc

exports.index = (req, res) ->
    res.render('index',
      {
        title: "ssboisen blog > home"
        post_title: latest_post.title,
        post_date: latest_post.post_date
        post_body: latest_post.body
      })
  )
