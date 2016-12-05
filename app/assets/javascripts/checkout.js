
$(document).ready(function() { 
  var appended = $('<p />').text("Pay on delievery ");
  var appended1= $('<p />').text(" Pay by card: send your money to this card number: ");
  $('.inputCheck').change(function() {
    if ($(this).val() == 'Yes') {
      $(appended).appendTo('#box1');
    } else {
      $(appended).remove();
    }
   if ($(this).val() == 'No') {
      $(appended1).appendTo('#box2');
    } else {
      $(appended1).remove();
    }
  })
})
