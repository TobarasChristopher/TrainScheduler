// app/assets/javascripts/alerts.js
$(document).ready(function() {
    setInterval(function() {
      $.ajax({
        url: '/schedules/expired_schedules',
        method: 'GET',
        dataType: 'json',
        success: function(data) {
          data.forEach(function(schedule) {
            alert('Schedule from ' + schedule.origin + ' to ' + schedule.destination + ' has expired at ' + schedule.schetime);
            // Customize the alert message or use a different way to notify the user
          });
        },
        error: function(error) {
          console.error('Error fetching expired schedules: ', error);
        }
      });
    }, 6000); // Poll every minute (adjust as needed)
  });
  