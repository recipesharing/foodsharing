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
//= require_tree .


document.addEventListener("turbolinks:load", function() {

  $(function() {
    if($.fn.cloudinary_fileupload !== undefined) {
      $("input.cloudinary-fileupload[type=file]").cloudinary_fileupload();
    }
  });


  $('.cloudinary-fileupload').bind('cloudinarydone', function(e, data) {  $('.preview').html(
     console.log( "upload done!", data ));
     // $.cloudinary.video(data.result.public_id, 
     //     { format: data.result.format, version: data.result.version, 
     //       crop: 'scale', width: 200 }));    
     $('.video_public_id').val(data.result.public_id);    
     // return true;
  });

  $('.cloudinary-fileupload').bind('fileuploadprogress', function(e, data) { 
    $('.progress').val(Math.round((data.loaded * 100.0) / data.total));
  });
});

