# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.vote_button').on 'click', (event) ->
    event.preventDefault()
    url = $(this).closest('a').attr('href')
    $.post url

  dispatcher = new WebSocketRails(window.location.host + '/websocket')

  channel = dispatcher.subscribe 'votes'

  channel.bind 'new', (post) ->
    $(".vote_count[data-id=#{post.id}]").html(post.new_vote_count)