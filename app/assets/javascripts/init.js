$(document).on('ready turbolinks:load', function(){
  trackRegistration();
});

function trackRegistration() {
  $( '#registerButton' ).click(function() {
    fbq('track', 'Lead');
  });
}
