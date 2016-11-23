// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery
//= require tether
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require cloudinary
//= require social-share-button
//= require owl.carousel
//= require cook_books
//= require_tree .

document.addEventListener("turbolinks:load", function() {

  $(".new-comment").bind('ajax:success', function(e, data, status, xhr){
    $(".comment-box").prepend(data);
    $("#comment").val('');
  });
// Todo: rebind problems for delete
  $(".delete-comment").bind('ajax:success', function(){
    console.log("last");
    $(this).parent().parent().fadeOut();
  });

  $(function() {
    if($.fn.cloudinary_fileupload !== undefined) {
      $("input.cloudinary-fileupload[type=file]").cloudinary_fileupload();
    }
  });


  $('.cloudinary-fileupload').bind('cloudinarydone', function(e, data) {  $('.preview').html(
     console.log( "upload done!", data ));
     $('.video_public_id').val(data.result.public_id);    
  });

  $('.cloudinary-fileupload').bind('fileuploadprogress', function(e, data) { 
    $('.progress').val(Math.round((data.loaded * 100.0) / data.total));
  });

  $("#owl-demo").owlCarousel({
      navigation : true, // Show next and prev buttons
      slideSpeed : 300,
      paginationSpeed : 400,
      singleItem:true
  });

  // cook-books
  $(".cuisine").on("click", function(){
    $(this).toggleClass("pick-cuisine");
  });

  $("form#cookbooks").on("submit", function(){
    var $hidden_cuisine = $("<input type='hidden' name='cuisine' id='cuisine'/>");
    var cuisine_selector = $("ul#cuisine-list").find("li.pick-cuisine");
    var cuisine = [];
    jQuery.each(cuisine_selector, function(){
      cuisine.push($(this).val());
    });
    $hidden_cuisine.val((cuisine));
    $(this).append($hidden_cuisine);
    return true;
  });
});
