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
//= require semantic-ui
//= require Chart
//= require excanvas
//= require turbolinks
//= require_tree .


$(function(){
    // remove flash notifications after 3 seconds
    setTimeout(function(){
        $('.message').remove();
      }, 3000);

    $('#post_hashtag').on('keypress', function(e){
        console.log(e.which);
        if (e.keyCode === 35 || e.keyCode === 32){
            e.preventDefault();
        }
    })

    // post a like
    current_like = 0;
    $('.js-like-action').on('click', function(e){
        e.preventDefault();
        var post_id = $(this).data('id');

        $.ajax({
            method: 'POST',
            url: '/like',
            data: {
                post_id: post_id
            }
        })

        like_count = $(this).text();

        if (current_like % 2 === 0) {
            current_like++
            (like_count)++;
            $(this).html("<i class='fa fa-heart' style='color: rgba(246, 32, 29, 0.9)'></i> " + like_count);
        } else {
            current_like--
            like_count--
            $(this).html("<i class='fa fa-heart-o'></i> " + like_count);
        }
    })


})