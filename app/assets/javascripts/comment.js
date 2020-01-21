$(function(){
  function buildHTML(comment){
    var html = `<li >
                  <div class="comments_list">
                    <div>
                      <a href=/users/${comment.user_id}>${comment.user_name}</a>
                    </div>
                    <div>
                      ${comment.text}
                    </div>
                    <a  data-method="delete" data-remote="true" class="comments__list__delete__icon" href="/posts/${comment.post_id}/comments/${comment.id}">
                      <i class="fas fa-trash "></i>
                    </a>
                  </div>
                </li>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.textbox').val('');
      $('.send').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
  // $('a').hover(
  //   function(){
  //     $('.hover').css('color','black');
  //   },
  //   function(){
  //     $('.hover').css('color','yellow');
  //   });
})