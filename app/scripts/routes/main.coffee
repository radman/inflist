'use strict';

class inflist.Routers.MainRouter extends Backbone.Router
  routes:
    "": "home"

  home: ->
    collection = new inflist.Collections.ItemCollection()
    collection.fetchNextPage()
    collection.fetchNextPage()

    homePage = new inflist.Views.HomePageView(collection: collection)
    $("#page-container").html(homePage.render().$el)

