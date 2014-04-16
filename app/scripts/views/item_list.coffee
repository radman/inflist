'use strict';

class inflist.Views.ItemListView extends Backbone.View
  tagName: "ul"
  className: "list"

  initialize: ->
    @collection.on 'reset', @render, @
    @collection.on 'add', @addOne, @

  addOne: (model) ->
    item = new inflist.Views.ItemView(model: model)
    @$el.append(item.render().el)

  addAll: ->
    @addOne(model) for model in @collection.models

  render: ->
    @$el.empty()
    @addAll()
    @

