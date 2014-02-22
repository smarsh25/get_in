
var urls = {
  content_index  : { url : '/activities/', url2 : '/content.json', method : 'get' },
  create_content : { url : '/activities/', url2 : '/content.json', method : 'post'}
};

var get_content = function(activity_id){
  $.ajax({
    url    : urls.content_index.url + activity_id + urls.content_index.url2,
    method : urls.content_index.method
  }).done(function(data){
  });
};

var create_content = function(activity_id, content){
  $.ajax({
    url    : urls.create_content.url + activity_id + urls.create_content.url2,
    method : urls.create_content.method,
    data   : {'content' : content}
  }).done(function(data){
  });
};

