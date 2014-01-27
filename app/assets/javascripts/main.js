$(document).ready(function () {
  $('input, textarea').placeholder();
  $('.block-scroll').jScrollPane();

  $(document).on('click', '.popup', function (e) {
    if ($(e.target).hasClass('popup')) {
      $(this).fadeOut();
    }

    if ($(e.target).hasClass('terms')) {
      $('.popup.questionnaire, .popup.question').fadeIn();
    }
  });
//  $(document).on('click', '.btn-i-know', function (e) {
//
//    $('.popup.questionnaire, .popup.question').fadeIn();
//
//  });

  $(document).on('click', '.modal-video', function (e) {
    $('.popup').fadeOut();
    $('.popup.vid').fadeIn();
    return false;
  });

  $(document).on('click', '.modal-terms', function (e) {
    $('.popup').fadeOut();
    $('.popup.terms').fadeIn();
    $('.block-scroll').jScrollPane();
    return false;
  });

  $(document).on('click', '.btn-close', function (e) {
    $('.popup').fadeOut();
    $('.popup.questionnaire, .popup.question').fadeIn();
    return false;
  });

  $(document).on('click', '.tab', function (e) {
    $('.tab').removeClass('active');
    $(this).addClass('active');
    $('.tab-block').hide();
    $('.tab-block:eq(' + $(this).attr('data-tab') + ')').show();
    $('.block-scroll').jScrollPane();
    return false;
  });

  $('.list-prize li').hover(
    function () {
      $('.list-prize li').removeClass('hover');
      $(this).addClass('hover');
      $('.prize-align img').attr('src', $(this).find('img').attr('data-img'));
      $('.prize-align h6').text($(this).find('img').attr('data-name'));
      $('#grand-prize').text($(this).find('img').attr('data-prize'));
    }, function () {

    }
  );
});