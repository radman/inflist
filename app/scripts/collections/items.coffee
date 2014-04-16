class inflist.Collections.ItemCollection extends Backbone.Collection
  initialize: ->
    @isFetching = false

  fetchNextPage: ->
    console.log "fetching"
    @isFetching = true
    fetch = =>
      for i in [0...10]
        name = "item " + Math.floor((Math.random()*1000)+1)
        @add {name: name}
      @isFetching = false

    setTimeout(fetch, 1000)

  isFetching: ->
    @isFetching

