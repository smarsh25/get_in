$(function() {

  var Activities = {};

  Activities.urls = {
    index: {path: '/activities.json', method: 'get'}
  };

  Activities.displayActivities = function(responseData) {
    $(responseData).each(function(index, activity) {
      $("#activities").append("<a href='/'>" + activity.title + "</a>");
    });
  };

  Activities.getItems = function() {
    //$.get(this.urls.index.path).done(this.displayActivities(responseData));
    $.get(this.urls.index.path).done(function(responseData) {
      $(responseData).each(function(index, activity) {
        $("#activities").append("<a href='/'>" + activity.title + "</a><br>");
      });
    });
  };

  Activities.getItems();

});