'use strict';

class inflist.Views.ItemListView extends Backbone.View
  template: JST["app/scripts/templates/item_list.hbs"]
  #tagName: "ul"
  #className: "list"
  #id: "items"

  initialize: ->
    @collection.on 'reset', @render, @
    @collection.on 'add', @addOne, @
    @collection.on 'fetchStart', @showLoadingMessage, @
    @collection.on 'fetchComplete', @hideLoadingMessage, @

    @currentlyFetching = false

    $(window).scroll =>
      if !@collection.isFetching && ($(window).scrollTop() > $(document).height() - $(window).height() - 50)
        @collection.fetchNextPage()

  addOne: (model) ->
    @$list ||= @$el.find("ul.list")
    item = new inflist.Views.ItemView(model: model)
    @$list.append(item.render().el)

  addAll: ->
    @addOne(model) for model in @collection.models

  render: ->
    @$el.html @template
    @$list ||= @$el.find("ul.list")
    @$list.empty()
    @addAll()
    @

  showLoadingMessage: ->
    $loadingMessage = @$el.find("#loading")
    $loadingMessage.removeClass('hidden')

  hideLoadingMessage: ->
    $loadingMessage = @$el.find("#loading")
    $loadingMessage.addClass('hidden')
