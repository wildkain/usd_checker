# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  App.cable.subscriptions.create({ channel: 'CurrenciesChannel' }, {
    connected: ->
      console.log 'Connected!';
      @perform 'follow'
      console.log 'CurrenciesChannel connected!'
    received: (data) ->
      console.log(data)
      console.log("Data received")
      $('#currency').replaceWith(data)
  })