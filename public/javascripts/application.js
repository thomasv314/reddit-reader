// Put your application scripts here
//
$(document).ready(function() {
  $('#subreddit-go').on('submit', function(evt) {
    evt.preventDefault()
    var val = $('#sub-field').val()
    window.location = "/r/" + val
  })
})
