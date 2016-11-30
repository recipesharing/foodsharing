function upload_handler_listen() {
  console.log('upload listening');
  $('.instruction-new input.cloudinary-fileupload').bind('cloudinarydone', function(e, data) {
    $('.preview').html(
      $.cloudinary.image(data.result.public_id,
        { format: data.result.format, version: data.result.version, 
          crop: 'fill', width: 300, height: 300 })
    );
    $('input#image_public_id').val(data.result.public_id);
    $('input#image_format').val(data.result.format);
    $('input#image_version').val(data.result.version);
  });

  $('.instruction-new input.cloudinary-fileupload').bind('fileuploadprogress', function(e, data) { 
    $('.progress').val(Math.round((data.loaded * 100.0) / data.total));
  });

  $('button#new-step').on('click', function() {
    // TODO check all input filled
    const title = $('.instructions-box input#title').val();
    const content = $('.instructions-box textarea#content').val();
    const image_data_id = $('input#image_public_id').val();
    if ( title === '' || content === '' || image_data_id === '' ) { return 0; }
    const data = { title: title,
                   content: content,
                   image_data_id: image_data_id};
    const template = [
          '<div class="card card-block row item">',
            '<div class="new-instruction-title">{{title}}</div>',
            '<div class="content" hidden="true">{{content}}</div>',
            '<div class="public_id" hidden="true">{{image_data_id}}</div>',
          '</div>'].join('\n');
    const html = Mustache.render(template, data);
    $('.created-list').append(html);
  });

  $('#background-uploader input.cloudinary-fileupload').bind('cloudinarydone', function(e, data) {
    $('input#image_background_id').val(data.result.url);
    $('input#background_name').val(data.result.public_id);
  })

}
