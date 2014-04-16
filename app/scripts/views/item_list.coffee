'use strict';

class inflist.Views.ItemListView extends Backbone.View
  tagName: "ul"
  className: "list"
  id: "items"

  initialize: ->
    @collection.on 'reset', @render, @
    @collection.on 'add', @addOne, @
    @currentlyFetching = false

    $(window).scroll =>
      if !@collection.isFetching && ($(window).scrollTop() > $(document).height() - $(window).height() - 50)
        @collection.fetchNextPage()

  addOne: (model) ->
    item = new inflist.Views.ItemView(model: model)
    @$el.append(item.render().el)

  addAll: ->
    @addOne(model) for model in @collection.models

  render: ->
    @$el.empty()
    @addAll()
    @

