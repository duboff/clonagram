
$(document).ready ->
  $('.comment-link').on 'click', (event) ->
    event.preventDefault()

    postUrl = $(this).data('post-url')
    commentArea = $(this).closest('.thumbnail').find('.comments')
    link = $(this)

    $.get postUrl, (post) ->
      if link.hasClass('clicked-once')
        commentArea.hide()
        link.removeClass('clicked-once')
      else if link.hasClass('appended')
        commentArea.show()
        link.addClass('clicked-once')
      else
        post.comments.forEach (comment) ->
          commentArea.append("<dt><small><strong class='comment-author'><i class='fa fa-user'></i> #{comment.author}</strong></small></dt><dd> #{comment.content}</dd>")
        commentArea.slideDown()
        link.addClass('appended clicked-once')