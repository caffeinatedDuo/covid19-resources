var $addTelemedicsDoctorsName;
var $addTelemedicsContactNo;
var $addTelemedicstiming;
var $addTelemedicsVerificationStatus;
var $addTelemedicsFunctionalStatus;
var $addTelemedicsLocation;

function telemedicsInit(){
  uiBindings();
}

function uiBindings(){
  $addTelemedicsDoctorsName = $('#doctors-name');
  $addTelemedicsContactNo = $('#contact-no');
  $addTelemedicstiming = $('#timing');
  $addTelemedicsVerificationStatus = $('#verification-status');
  $addTelemedicsFunctionalStatus = $('#functional-status');
  $addTelemedicsLocation = $('#location');
}

function handleAddTelemedicsFormSubmit(){
  var formData = new FormData();
  formData.append('doctors-name',$addTelemedicsDoctorsName[0].value);
  formData.append('contact-no', $addTelemedicsContactNo[0].value);
  formData.append('timing', $addTelemedicstiming[0].value);
  formData.append('verification-status', $addTelemedicsVerificationStatus[0].value);
  formData.append('functional-status', $addTelemedicsFunctionalStatus[0].value);
  formData.append('location', $addTelemedicsLocation[0].value);

  $.ajax({
    beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    contentType: false,
    data: formData,
    processData: false,
    type: 'POST',
    url: '/telemedics',
    // TO-DO: Add Success and failue Cases
  });
}

$('#telemedics-form__add-new').on('submit', function(e){
  e.preventDefault();
  handleAddTelemedicsFormSubmit();
});

telemedicsInit();