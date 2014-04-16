class inflist.Collections.ItemCollection extends Backbone.Collection
  model: inflist.Models.ItemModel

  fetchNextPage: ->
    @add [
      {name: "radu"},
      {name: "anca"}
    ]

