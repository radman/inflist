'use strict';

class inflist.Views.ItemView extends Backbone.View
  template: JST["app/scripts/templates/item.hbs"]
  tagName: "li"

  render: ->
    @$el.html @template
      model: @model.toJSON()

    @
