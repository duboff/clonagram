# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.vote_button').on 'click', (event) ->
    event.preventDefault()
    url = $(this).closest('form').attr('action')
    voteCount = $(this).closest('.votes').find('.vote_count')

    $.post url, (post) ->
      voteCount.html post.vote_count