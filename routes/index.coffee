repo = require '../modules/blog_repo'
_ = require 'underscore'

sleep = (milliSeconds) ->
    startTime = new Date().getTime();
    while (new Date().getTime() < startTime + milliSeconds) then


exports.index = (req, res) ->
    repo.posts.get_all \
    (() -> console.log "no documents received"), 
    ((posts) ->
      vm = { title: "ssboisen"}
      vm.posts = _.map(posts, (post) ->
        {
          title: post.title,
          date: post.post_date
          body: post.body
        })

      res.render('index', vm)
    )

exports.about = (req, res) ->
  vm = { title: "ssboisen > about" }
  res.render('about', vm)
