$(function() {

  var Activities = {};

  Activities.urls = {
    index: {path: '/activities.json', method: 'get'},
    create: {path: '/activities.json', method: 'post'}
  };

  Activities.saveActivity = function(event) {
    var _this = Activities;

    event.preventDefault();

    // collect the activity text fields entered by user
    var newActivity = {};
    newActivity.title = $("#activity_title").val();
    newActivity.body = $("#activity_body").val();

    // collect checked categories to save
    var checkedCategories = $(".categoryCheckboxes").filter(":checked");
    console.log(checkedCategories);

    // save the new activity on the back end, and on success display
    $.post(_this.urls.create.path, {activity: newActivity}).done(_this.displayNewActivity);
  };

  Activities.displayActivities = function(responseData) {
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

      // append/display new saved activity
      var activityHTML = HandlebarsTemplates.activities(responseData);
      $("#activities").append(activityHTML);
  };

  Activities.getItems = function() {
    $.get(this.urls.index.path).done(this.displayActivities);
  };

  Activities.setEventHandlers = function() {
    $('#add_activity').on('submit', Activities.saveActivity);
  };

  Activities.setEventHandlers();
  Activities.getItems();

});