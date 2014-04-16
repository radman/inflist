class inflist.Collections.ItemCollection extends Backbone.Collection
  isFetching: false

  fetchNextPage: ->
    @trigger "fetchStart"
    @isFetching = true
    fetch = =>
      for i in [0...10]
        name = "item " + Math.floor((Math.random()*1000)+1)
        @add {name: name}
      @isFetching = false
      @trigger "fetchComplete"

    # make it look like an ajax call
    setTimeout(fetch, 1000)

