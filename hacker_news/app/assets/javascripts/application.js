// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $('.vote-count').on('click', function(event) {
    event.preventDefault();
    $target = $(event.target);
    // my user can vote as many times. cheating is allowed! nobody cares...! votes are good!
    //$target.attr("disabled", "true");
    $form = $target.parent();

     $.ajax( {
        type: $form.attr('method'),
        url: $form.attr('action'),
        data: $target.serialize(),
        dataType: "JSON"
     }).done(function(response) {
       $form.parent().children('.vote-area').html(response.post_votes);
     });
  });
});
