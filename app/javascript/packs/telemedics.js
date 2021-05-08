var $addTelemedicsForm;
var $addTelemedicsDoctorsName;
var $addTelemedicsContactNo;
var $addTelemedicstiming;
var $addTelemedicsVerificationStatus;
var $addTelemedicsFunctionalStatus;
var $addTelemedicsLocation;
var $updateTelemedicsID;

var $loaderOverlay;
var $savingLoader;

function telemedicsInit(){
  uiBindings();
}

function uiBindings(){
  $addTelemedicsForm = $('#telemedics-form__add-new');
  $addTelemedicsDoctorsName = $('#doctors-name');
  $addTelemedicsContactNo = $('#contact-no');
  $addTelemedicstiming = $('#timing');
  $addTelemedicsVerificationStatus = $('#verification-status');
  $addTelemedicsFunctionalStatus = $('#functional-status');
  $addTelemedicsLocation = $('#location');
  $updateTelemedicsID = $('#update-telemedics-entry-id');
  $loaderOverlay = $('.loader__overlay');
  $savingLoader = $('.loader__saving');

  $('#telemedics-form__add-new').on('submit', function (e) {
    e.preventDefault();
    handleAddTelemedicsFormSubmit();
  });

  $('#telemedics-form__update-new').on('submit', function (e) {
    e.preventDefault();
    handleUpdateTelemedicsFormSubmit();
  });
}

function handleAddTelemedicsFormSubmit(){
  showSavingLoader(true);

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
    success: function () {
      alert('Successfully Added the Entry!');
      showSavingLoader(false);
    },
    error: function(){
      alert('Raise Sentry Error!');
    }
  });
}

function handleUpdateTelemedicsFormSubmit(){
  var formData = new FormData();
  formData.append('doctors-name', $addTelemedicsDoctorsName[0].value);
  formData.append('contact-no', $addTelemedicsContactNo[0].value);
  formData.append('timing', $addTelemedicstiming[0].value);
  formData.append('verification-status', $addTelemedicsVerificationStatus[0].value);
  formData.append('functional-status', $addTelemedicsFunctionalStatus[0].value);
  formData.append('location', $addTelemedicsLocation[0].value);
  formData.append('id', $updateTelemedicsID[0].value);

  $.ajax({
    beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    contentType: false,
    data: formData,
    processData: false,
    type: 'POST',
    url: '/dashboard/updateTelemedic',
    // TO-DO: Add Success and failue Cases
    success: function () {
      alert('Successfully Added the Entry!');
      showSavingLoader(false);
    },
    error: function () {
      alert('Raise Sentry Error!');
    }
  });
}

function showSavingLoader(toShow){
  if (toShow){
    $savingLoader.removeClass('hide');
    $loaderOverlay.removeClass('hide');
  } else {
    $savingLoader.addClass('hide');
    $loaderOverlay.addClass('hide');
  }
}

telemedicsInit();