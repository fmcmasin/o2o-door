/* Copyright (c) 2009 José Joaquín Núñez (josejnv@gmail.com) http://joaquinnunez.cl/blog/
 * Licensed under GPL (http://www.opensource.org/licenses/gpl-2.0.php)
 * Use only for non-commercial usage.
 *
 * Version : 0.1
 *
 * Requires: jQuery 1.2+
 */

(function(jQuery)
{
  jQuery.fn.clock = function(options)
  {
    var defaults = {
      type: 'analog'
    };
    var _this = this;
    var opts = jQuery.extend(defaults, options);

    setInterval( function() {
      var seconds = jQuery.calcTime().getSeconds();
      if(opts.type=='analog')
      {
        var sdegree = seconds * 6;
        var srotate = "rotate(" + sdegree + "deg)";
        jQuery(_this).find(".sec").css({"-moz-transform" : srotate, "-webkit-transform" : srotate});
      }
      else
      {
        jQuery(_this).find(".sec").html(seconds);
      }
    }, 1000 );

    setInterval( function() {
      var hours = jQuery.calcTime().getHours();
      var mins = jQuery.calcTime().getMinutes();
      if(opts.type=='analog')
      {
        var hdegree = hours * 30 + (mins / 2);
        var hrotate = "rotate(" + hdegree + "deg)";
        jQuery(_this).find(".hour").css({"-moz-transform" : hrotate, "-webkit-transform" : hrotate});
      }
      else
      {
        jQuery(_this).find(".hour").html(hours);
      }
      var meridiem = hours<12?'AM':'PM';
      jQuery(_this).find('.meridiem').html(meridiem);
    }, 1000 );

    setInterval( function() {
      var mins = jQuery.calcTime().getMinutes();
      if(opts.type=='analog')
      {
        var mdegree = mins * 6;
        var mrotate = "rotate(" + mdegree + "deg)";        
        jQuery(_this).find(".min").css({"-moz-transform" : mrotate, "-webkit-transform" : mrotate});                
      }
      else
      {
        jQuery(_this).find(".min").html(mins);
      }
    }, 1000 );
  }
})(jQuery);


jQuery.calcTime = function() {

  // create Date object for current location
  var d = new Date();

  return d;
};
