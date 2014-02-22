$(function() {

  var Activities = {};

  Activities.urls = {
    index: {path: '/activities.json', method: 'get'}
  };

  Activities.displayActivities = function(responseData) {
    $(responseData).each(function(index, activity) {
      $("#activities").append();
    });
  };

  Activities.getItems = function() {
    $.get(this.index.path).done(this.displayActivities(responseData));
  };

  Activities.getItems();

});