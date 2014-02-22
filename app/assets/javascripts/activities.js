$(function() {

  var Activities = {};

  Activities.urls = {
    index: {path: '/activities.json', method: 'get'}
  };

  Activities.displayActivities = function(responseData) {
      $(responseData).each(function(index, activity) {
        var activityHTML = HandlebarsTemplates.activities(activity);
        $("#activities").append(activityHTML);
      });
  };

  Activities.getItems = function() {
    $.get(this.urls.index.path).done(this.displayActivities);
  };

  Activities.getItems();

});