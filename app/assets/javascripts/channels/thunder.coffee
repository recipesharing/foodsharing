App.thunder = App.cable.subscriptions.create "ThunderChannel",
  connected: ->
    console.log("connected to thunder chanel")
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
  test: (data) ->
    console.log(data)
    @perform 'test', message: data
