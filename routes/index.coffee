repo = require '../modules/blog_repo'


sleep = (milliSeconds) ->
    startTime = new Date().getTime();
    while (new Date().getTime() < startTime + milliSeconds) then


exports.index = (req, res) ->
    repo.posts.get_latest \
    (() -> console.log "no documents received"), 
    ((latest_post) ->
      res.render('index',
      {
        title: "ssboisen blog > home"
        post_title: latest_post.title,
        post_date: latest_post.post_date
        post_body: latest_post.body
      }))
