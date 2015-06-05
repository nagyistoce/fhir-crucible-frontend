(function(global) {
  var jQuery = global.jQuery;

  jQuery.fn.carousel.Constructor.prototype.destroy = function() {
    this.pause();
    this.$element.removeData('bs.carousel');
  };
})(this);
