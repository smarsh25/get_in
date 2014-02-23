$(function(){
  var Content = {};
  Content.urls = {
  content_index  : { url : '/activities/', url2 : '/content.json', method : 'get' },
  create_content : { url : '/activities/', url2 : '/content.json', method : 'post'}
  };

  Content.render_content = function(content) {
    content = content;
    html = HandlebarsTemplates.content(content);
    $('#content').append(html);
  };

  Content.get_content = function(activity_id, callback){
    var _this = this;
    $.ajax({
      url    : this.urls.content_index.url + activity_id + this.urls.content_index.url2,
      method : this.urls.content_index.method
    }).done(function(data){
      callback(data);
    });
  };

  Content.create_content = function(activity_id, content){
    var _this = this;
    $.ajax({
      url    : this.urls.create_content.url + activity_id + this.urls.create_content.url2,
      method : this.urls.create_content.method,
      data   : {'content' : content}
    }).done(function(data){
      _this.render_content(data.content);
    });
  };

  Content.do_this = function(fn){
        fn.apply(Content);
        return this;
  };

  Content.do_this(function(){
    $('#add_activity_content').on('submit', function(event){
      event.preventDefault();
      var activity_id = this.attributes['activity-id'].value;
      content = {};
      content.title = $('#content_title').val();
      $('#content_title').val('');
      Content.create_content(activity_id, content);
    });
  });
  Content.get_content($('#content').attr('activity-id'), function(data){
    $(data.contents).each(function(index, item){
        Content.render_content(item);
      });
    });
  });




