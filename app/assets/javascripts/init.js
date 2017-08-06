$(document).on('ready turbolinks:load', function(){
  trackRegistration();
  changeFileInputContent();
});

function trackRegistration() {
  $( '#registerButton' ).click(function() {
    fbq('track', 'Lead');
  });
}

function changeFileInputContent() {
  $('input[type="file"]').on('change', function() {
    $(this).next('.custom-file-control').attr('data-content-value', $(this)[0].files[0].name);
  });
}
