'use strict';

class inflist.Routers.MainRouter extends Backbone.Router
  routes:
    "": "home"

  home: ->
    homePage = new inflist.Views.HomePageView()
    $("#page-container").html(homePage.render().$el)

