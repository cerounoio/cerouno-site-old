$(document).on('ready turbolinks:load', function(){
  trackRegistration();
  changeFileInputContent();
  changeTeachersDataOnClick();
  changeTeamDataOnClick();
  changeProgramMentorsDataOnClick();
  copyApplicationEmails();
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

function copyApplicationEmails() {
  $('#copyApplicationEmails').click(function() {
    var applicantEmails = [];

    applicantEmails     = getApplicantData()
    applicantEmailsText = applicantEmails.get().join(', ')

    prompt('Copia los emails de las aplicaciones con CMD+C', applicantEmailsText)
  })
}

function getApplicantData() {
  var firstName = ""
  var lastName  = ""
  var email     = ""
  var applicant = ""

  return $('.application').map(function() {
    firstName = $(this).data('first-name')
    lastName  = $(this).data('last-name')
    email     = $(this).data('email')
    applicant = firstName + " " + lastName + " <" + email + ">"

    return applicant
  })
}
