config = require '../config'
mongojs = require 'mongojs'

collections = ['posts']
connection_string = "#{config.db.username}:#{config.db.password}@#{config.db.host}:#{config.db.port}/#{config.db.name}"

db = mongojs.connect connection_string, collections

exports.posts = {}

exports.posts.get_all = (got_nothing, get_all_docs) ->
                          db.posts.find (err, docs) ->
                            console.log err if err?
                            if docs
                              get_all_docs(docs)
                            else
                              got_nothing()

exports.posts.get_latest =  (no_doc, latest_doc) ->
                              db.posts.find().sort({ post_date: -1 }).limit(1).next (err, doc) ->
                                console.log err unless !err
                                if doc 
                                  latest_doc(doc)
                                else 
                                  no_doc()

exports.posts.insert_doc = (doc) -> db.posts.insert doc

exports.posts.remove_all = () -> db.posts.remove()
