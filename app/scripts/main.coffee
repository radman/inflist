window.inflist =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    'use strict'
    inflist.mainRouter = new inflist.Routers.MainRouter()
    Backbone.history.start()

$ ->
  'use strict'
  inflist.init();

