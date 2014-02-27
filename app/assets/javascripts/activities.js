$(function() {
  var Activities = {};

  Activities.urls = {
    index: {path: '/activities.json', method: 'get'},
    create: {path: '/activities.json', method: 'post'},
    // An id must be added to the activities update path
    update: {path: '/activities/', method: 'patch'}
  };

  Activities.saveActivity = function(event) {
    var _this = Activities;

    event.preventDefault();

    // collect the activity text fields entered by user
    var newActivity = {};
    newActivity.title = $('#activity_title').val();
    newActivity.body = $('#activity_body').val();

    // collect checked categories to save (nested attributes of activity)
    newActivity.tags_attributes = [];
    $('.categoryCheckboxes').filter(':checked').each(function() {
      newActivity.tags_attributes.push({category_id: this.id});
    });

    // save the new activity on the back end, and on success display
    $.post(_this.urls.create.path, {activity: newActivity}).done(_this.displayNewActivity);
  };

  Activities.redirect = function() {
    window.location = "/activities/";
  };

  Activities.updateActivity = function(event) {
    var _this = Activities;

    event.preventDefault();

    // collect the activity text fields entered by user
    var updatedActivity = {};
    updatedActivity.title = $('#activity_title').val();
    updatedActivity.body = $('#activity_body').val();

    // collect checked categories to save (nested attributes of activity)
    updatedActivity.tags_attributes = [];
    $('.categoryCheckboxes').filter(':checked').each(function() {
      updatedActivity.tags_attributes.push({category_id: this.id});
    });
    var id = $("#update_activity").attr('activity-id');
    // save the updated activity on the back end, and on success display
    $.ajax({url:  _this.urls.update.path + id + '.json',
            type: _this.urls.update.method,
            data: {activity: updatedActivity}}).done(_this.redirect);
  };

  Activities.displayActivities = function(responseData) {
      // list the saved activities
      $(responseData).each(function(index, activity) {
        var activityHTML = HandlebarsTemplates.activities(activity);
        $('#activities').append(activityHTML);
      });
  };

  Activities.displayNewActivity = function(responseData) {
      // clear out stale data entry text fields
      $('#activity_title').val('');
      $('#activity_body').val('');
      $('.categoryCheckboxes').each(function(){$(this).prop('checked',false);});

      // clear the modal dialog (was showing to add new activity)
      $("#add_activity_modal").modal('hide');

      // append/display new saved activity
      var activityHTML = HandlebarsTemplates.activities(responseData);
      $('#activities').append(activityHTML);
  };

  Activities.getItems = function() {
    $.get(this.urls.index.path).done(this.displayActivities);
  };

  Activities.setEventHandlers = function() {
    $('#add_activity').on('submit', Activities.saveActivity);
    $('#update_activity').on('submit', Activities.updateActivity);
    $('#submit_edited_activity').on('click', Activities.updateActivity);
    $('#submit_activity').on('click', Activities.saveActivity);
  };
  
  Activities.setEventHandlers();
  // if on the create activity page (index), then get items to display
  if ($('#add_activity').length !== 0) {
    Activities.getItems();
  }

  $('.main-content').addClass('smallhead');

  $(document).on("scroll",function(){
    var window_height = $( window ).height();
    minimize_header_threshold = window_height*0.10;
    if ($('.act_index_section').length !== 0) {
        if($(document).scrollTop()>minimize_header_threshold){
        $("header").removeClass("large").addClass("small");
        $('.main-content').addClass('smallhead');
        $('.graphicals').addClass('stuck');
        $('.school_story').css({display: 'none'});
        $('.users_name').addClass('thin');
        $('.student').addClass('thin');
        $('.graphicals').removeClass('stuck').addClass('smallhead');
      } else{
        $("header").removeClass("small").addClass("large");
        $(".school_story").removeClass('off');
        $('.school_story').css({display: 'inline'});
        $('.student_pic').css({display: 'inline'});
        $('.graphicals').removeClass('smallhead').addClass('largehead');
        $('.student').removeClass('thin');
      }
    }
  });


    if ($('.act_show_section').length !== 0) {
        $("header").removeClass("large").addClass("small");
        $('.main-content').addClass('smallhead');
        $('.graphicals').addClass('stuck');
        $('.school_story').css('display', 'none', 'important');
        $('.users_name').addClass('thin');
        $('.student').addClass('thin');
        $('.graphicals').removeClass('stuck').addClass('smallhead');
    }

      // $('.activity_buttons').hide();
      // $('.activity_show').hover(function(){
      //   $('.activity_buttons').slideToggle();
      //   $('.activity_show').mouseleave(function(){
      //     // $('.activity_buttons').slideToggle();
      //   });
      // });

    if ($('activity_show').length !== 0) {
        $("header").removeClass("small").addClass("large");
        $('.school_story').addClass('off');
        $('.student_pic').css({display: 'inline'});
        $('.graphicals').removeClass('smallhead').addClass('largehead');
        $('.student').removeClass('thin');

        $('.hidden_buttons').css('display', 'none');


    }
});




$(function () {
    $('.list-group.checked-list-box .list-group-item').each(function () {
        
        // Settings
        var $widget = $(this),
            $checkbox = $('<input id="' + this.id + '" type="checkbox" class="hidden categoryCheckboxes" />'),
            color = ($widget.data('color') ? $widget.data('color') : "primary"),
            style = ($widget.data('style') == "button" ? "btn-" : "list-group-item-"),
            settings = {
                on: {
                    icon: 'glyphicon glyphicon-check'
                },
                off: {
                    icon: 'glyphicon glyphicon-unchecked'
                }
            };
            
        $widget.css('cursor', 'pointer');
        $widget.append($checkbox);

        // Event Handlers
        $widget.on('click', function () {
            $checkbox.prop('checked', !$checkbox.is(':checked'));
            $checkbox.triggerHandler('change');
            updateDisplay();
        });
        $checkbox.on('change', function () {
            updateDisplay();
        });
          

        // Actions
        function updateDisplay() {
            var isChecked = $checkbox.is(':checked');

            // Set the button's state
            $widget.data('state', (isChecked) ? "on" : "off");

            // Set the button's icon
            $widget.find('.state-icon')
                .removeClass()
                .addClass('state-icon ' + settings[$widget.data('state')].icon);

            // Update the button's color
            if (isChecked) {
                $widget.addClass(style + color + ' active');
            } else {
                $widget.removeClass(style + color + ' active');
            }
        }

        // Initialization
        function init() {
            
            if ($widget.data('checked') === true) {
                $checkbox.prop('checked', !$checkbox.is(':checked'));
            }
            
            updateDisplay();

            // Inject the icon if applicable
            if ($widget.find('.state-icon').length === 0) {
                $widget.prepend('<span class="state-icon ' + settings[$widget.data('state')].icon + '"></span> ');
            }
        }
        init();
    });
});
