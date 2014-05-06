$(document).ready(function() {
  $("#message")
    .hide().delay(500).slideDown("slow")

    .on('click', function() {
      $(this).slideUp("slow");
    });

  $('#message-wrapper')
    .on('mouseenter', function() {
      $('#message').stop(true, false).slideDown("slow");
    })
    .on('mouseleave', function() {
      $('#message').stop(true, false).slideUp("slow");
    });
});