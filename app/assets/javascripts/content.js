$(function(){
  var Content = {};
  Content.urls = {
  index  : { url : '/activities/', url2 : '/content.json', method : 'get' },
  create : { url : '/activities/', url2 : '/content.json', method : 'post'}
  };
  //renders a givin content object
  Content.render = function(content) {
    if (content.kind === 'text') {
      html = HandlebarsTemplates.content(content);
      $('#content').append(html);
    }else if (content.kind == 'image'){
      html = HandlebarsTemplates.content_image(content);
      $('#content').append(html);
    }
  };
  //gets and arrary of content objects from the server
  Content.get = function(activity_id, callback){
    var _this = this;
    $.ajax({
      url    : this.urls.index.url + activity_id + this.urls.index.url2,
      method : this.urls.index.method
    }).done(function(data){
      callback(data);
    });
  };
  //sends a post request to the server to add content to the activity
  Content.create = function(activity_id, new_content){
    var _this = this;
    new_content.kind = "text";
    $.ajax({
      url    : this.urls.create.url + activity_id + this.urls.create.url2,
      method : this.urls.create.method,
      data   : {'content' : new_content}
    }).done(function(data){
      _this.render(data.content);
    });
  };
  //runs a function within the Content scope
  Content.do_this = function(fn){
        fn.apply(Content);
        return this;
  };
 
  // if on a page where content should be shown
  if ( $('#content').length !== 0 ){
    //gets all the content and renders it on the page
    Content.get($('#content').attr('activity-id'), function(data){
      $(data.contents).each(function(index, item){
          Content.render(item);
      });
    });
    //when user submits form gets title of content clear the field and calls create content
    Content.do_this(function(){
      $('#add_activity_content').on('submit', function(event){
        event.preventDefault();
        var activity_id = this.attributes['activity-id'].value;
        var new_content = {};
        new_content.title = $('#content_title').val();
        $('#content_title').val('');
        Content.create(activity_id, new_content);
      });
    });
     
  }
});





