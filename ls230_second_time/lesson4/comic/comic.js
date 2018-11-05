$(function () {
  var $blinds = $('[id^=blind]');
  var speed = 250;
  var delay = 1500;

  function startAnimation() {
    $blinds.each(function(i) {
      var $blind = $blinds.eq(i);
      $blind.delay(delay * i + 250).animate({
        top: "+=" + $blind.height(),
        height: 0,
      }, speed);
    });
  }

  $('a').on('click', function(e) {
    e.preventDefault();

    $blinds.removeAttr('style');
    startAnimation();
  });

  startAnimation();
});
