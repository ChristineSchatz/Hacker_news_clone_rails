$(document).ready(function() {
  // $('.vote-count').on('click', function(event) {
  //   event.preventDefault();
  //   $target = $(event.target);
  //   // my user can vote as many times. cheating is allowed! nobody cares...! votes are good!
  //   //$target.attr("disabled", "true");
  //   $form = $target.parent();

  //    $.ajax( {
  //       type: $form.attr('method'),
  //       url: $form.attr('action'),
  //       data: $target.serialize(),
  //       dataType: "JSON"
  //    }).done(function(response) {
  //      $form.parent().children('.vote-area').html(response.post_votes);
  //    });
  // });

  $('.upvote-form').on('submit',function(event){
    event.preventDefault();
    var target = event.target;
    var action = target.action; 
    var method = target.method;

    $.ajax({url: action, method: method}).done(function(response){
      $("#post-"+response.post_id+ "> .vote-area").text(response.post_votes);
    }).fail(function(error){console.log(error)});
  });

  $('#comment_link').on('click', function(event) {
    event.preventDefault();
    $.ajax({
        url: $("#comment_link").attr('href'),
        method: 'get'
    }).done(function(response) {
        $('#comment_area').append(response);
        $('#comment_link').hide();
    })
  });

  // YOu don't need to run the $() on the filter, just use the selector
  // $("#comment_area").on('submit', '#new_comment', function(e){})
  $("#comment_area").on('submit', $('#new_comment'), function(event) {
    event.preventDefault();
    $.ajax({
        url: $('#new_comment').attr('action'),
        method: 'post',
        data: $('#new_comment').serialize(),
        dataType: "JSON"

    }).done(function(response) {
        $('#comments').append(response.data);
        $('#new_comment')[0].reset();
        console.log(response.data);
    })

  });
});