# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
new WOW().init();

jQuery ($) ->
  $('a.smooth-scroll').smoothScroll({
    speed: 800
  });
  ###
  $('#main').fullpage({
    scrollingSpeed: 500,
    verticalCentered: false,
    autoScrolling: false,
    fitToSection: true,
    scrollBar: true,
    normalScrollElements: '#think'
  });
  ###
