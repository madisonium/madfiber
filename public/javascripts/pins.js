$(function(){
  $('body').append(function(){
    return '<form id="main_form" style="display: none" method="post">' +
      '<input type="hidden" name="authenticity_token" value="' + 
      window.authenticity_token +
      '"/></form>';
  });
  $('a[data-method="post"]').live('click', function(){
    $('#main_form').attr('action', $(this).attr('href')).submit();
    return false;
  });
});
