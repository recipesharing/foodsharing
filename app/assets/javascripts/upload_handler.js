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
    $('.progress#progress-step-image').val(Math.round((data.loaded * 100.0) / data.total));
  });

  $('button#new-step').on('click', function() {
    // TODO check all input filled
    const title = $('.instructions-box input#title').val();
    const content = $('.instructions-box textarea#content').val();
    const image_data_id = $('input#image_public_id').val();
    if ( title === '' || content === '' || image_data_id === '' ) { return 0; }
    var image_id = $('input#image_public_id').val();
    const image = $.cloudinary.image(image_id, { crop: 'fill', width: 100, height: 100 }).get(0);
    const data = { title: title,
                   content: content,
                   image_data_id: image_data_id,
                   omage: image};
    const template = [
          '<div class="card card-block row item">',
            '<div class="row">',
              '<div class="col-xs-3 image-place">',
                '<img height: "50" width: "50" src="" id={{image_data_id}}>',
              '</div>',
              '<div class="col-xs-9">',
                '<div class="new-instruction-title">{{title}}</div>',
                '<div class="content" hidden="true">{{content}}</div>',
                '<div class="public_id" hidden="true">{{image_data_id}}</div>',
              '</div>',
          '</div>'].join('\n');
    const html = Mustache.render(template, data);
    debugger;
    $('.created-list').append(html);
    $('.created-list img#' + image_id).parent().html(image);
  });

  $('#background-uploader input.cloudinary-fileupload').bind('cloudinarydone', function(e, data) {
    $('input#image_background_id').val(data.result.url);
    $('input#background_name').val(data.result.public_id);
  })

  // video upload events handler
  $('.video-uploader input.cloudinary-fileupload').bind('fileuploadprogress', function(e, data) { 
    $('.progress#progress-video').val(Math.round((data.loaded * 100.0) / data.total));
  });

  // background image uploader
  $('#background-uploader input.cloudinary-fileupload').bind('fileuploadprogress', function(e, data) { 
    $('.progress#progress-background-image').val(Math.round((data.loaded * 100.0) / data.total));
  });
}
