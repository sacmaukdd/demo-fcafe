$(document).ready(function() {
  $('.alert').slideDown(300, function() {
    window.setTimeout(function() {
      $('.alert').slideUp(300, function() {
        $('.alert').hide();
      });
    }, 3000);
  });
});
