'use strict';

class inflist.Views.ItemListView extends Backbone.View
  id: "item_list"
  template: JST["app/scripts/templates/item_list.hbs"]

  render: ->
    @$el.html @template()

    @

