function upload_handler_listen() {
  console.log('upload listening');
  $('.instruction-new input.cloudinary-fileupload').bind('cloudinarydone', function(e, data) {
    $('.preview').html(
      $.cloudinary.image(data.result.public_id, 
        { format: data.result.format, version: data.result.version, 
          crop: 'fill', width: 150, height: 100 })
    );
  });

  $('.instruction-new input.cloudinary-fileupload').bind('fileuploadprogress', function(e, data) { 
    $('.progress').val(Math.round((data.loaded * 100.0) / data.total));
  });

  $('button#new-step').on('click', () => {
    // TODO check all input filled
    const title = $('input#title').val();
    if (title === '') { return false}
    $('.preview').append('<h1>'+title+'</h1>')
    console.log("submited");
  });

}
