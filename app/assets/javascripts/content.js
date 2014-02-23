$(function(){
  var Content = {};
  Content.urls = {
  content_index  : { url : '/activities/', url2 : '/content.json', method : 'get' },
  create_content : { url : '/activities/', url2 : '/content.json', method : 'post'}
  };
  //renders a givin content object
  Content.render_content = function(content) {
    content = content;
    html = HandlebarsTemplates.content(content);
    $('#content').append(html);
  };
  //gets and arrary of content objects from the server
  Content.get_content = function(activity_id, callback){
    var _this = this;
    $.ajax({
      url    : this.urls.content_index.url + activity_id + this.urls.content_index.url2,
      method : this.urls.content_index.method
    }).done(function(data){
      callback(data);
    });
  };
  //sends a post request to the server to add content to the activity
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
  //runs a function within the Content scope
  Content.do_this = function(fn){
        fn.apply(Content);
        return this;
  };
  //when user submits form gets title of content cleare the field and calls create content
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
  //gets all the content and renders it on the page
  Content.get_content($('#content').attr('activity-id'), function(data){
    $(data.contents).each(function(index, item){
        Content.render_content(item);
      });
    });
  });




