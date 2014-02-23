$(function() {

  var Activities = {};

  Activities.urls = {
    index: {path: '/activities.json', method: 'get'},
    create: {path: '/activities.json', method: 'post'}
  };

  Activities.saveActivity = function(event) {
    event.preventDefault();

    // collect the activity text fields entered by user
    var newActivity = {};
    newActivity.title = $("#activity_title").val();
    newActivity.body = $("#activity_body").val();

    // save the new activity on the back end, and on success display
    $.post(this.urls.create.path, {activity: newActivity}).done(this.displayNewActivity);
  };

  Activities.displayActivities = function(responseData) {
      // clear out the data entry text fields
      //$("#activity_title").val("");
      //$("#activity_body").val("");

      // list the saved activities
      $(responseData).each(function(index, activity) {
        var activityHTML = HandlebarsTemplates.activities(activity);
        $("#activities").append(activityHTML);
      });
  };

  Activities.displayNewActivity = function(responseData) {
      // clear out the data entry text fields
      $("#activity_title").val("");
      $("#activity_body").val("");

      // append/dispaly new saved activity
      var activityHTML = HandlebarsTemplates.activities(responseData);
      $("#activities").append(activityHTML);
  };

  Activities.getItems = function() {
    $.get(this.urls.index.path).done(this.displayActivities);
  };

  Activities.setEventHandlers = function() {
    $('#add_activity').on('submit', function(event){Activities.saveActivity(event);});
  };

  Activities.setEventHandlers();
  Activities.getItems();

});