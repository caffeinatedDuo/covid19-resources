function handleAddTelemedicsFormSubmit(){
  var formData = new FormData();
  formData.append('doctors-name',"a");
  formData.append('contact-no',"a");
  formData.append('timing',"a");
  formData.append('verification-status',"a");
  formData.append('functional-status',"a");
  formData.append('location',"a");

  $.ajax({
    beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    contentType: false,
    data: formData,
    processData: false,
    type: 'POST',
    url: '/telemedics',
  });
}

$('#add-telemedics-form').on('submit', function(e){
  e.preventDefault();
  handleAddTelemedicsFormSubmit();
});
