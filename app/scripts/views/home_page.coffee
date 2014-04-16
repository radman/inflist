'use strict';

class inflist.Views.HomePageView extends Backbone.View
  id: "home_page"
  template: JST["app/scripts/templates/home_page.hbs"]

  initialize: ->
    @subviews = []
    @subviews.push new inflist.Views.ItemListView(collection: @collection)
    @collection.on 'fetchStart', @showLoadingMessage, @
    @collection.on 'fetchComplete', @hideLoadingMessage, @
    
  render: ->
    @$el.html @template
      title: "InfList Demo"

    $content = @$el.find(".content .subviews")
    $content.append(subview.render().el) for subview in @subviews

    @

  delegateEvents: ->
    subview.delegateEvents() for subview in @subviews
    super

  showLoadingMessage: ->
    $loadingMessage = @$el.find("#loading")
    $loadingMessage.removeClass('hidden')

  hideLoadingMessage: ->
    $loadingMessage = @$el.find("#loading")
    $loadingMessage.addClass('hidden')
