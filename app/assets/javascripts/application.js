// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(function() {
  $(".iframe").colorbox({
    iframe:true,
    width:"80%",
    height:"80%",
    opacity:1
  });
});

$(function() {
  $(".photo").colorbox({
    maxWidth:"90%",
    maxHeight:"90%",
    opacity:0.9
  });
});

$(function() {
  $(".gallery").colorbox({
    rel:'slideshow',
    slideshow:false,
    maxWidth:"90%",
    maxHeight:"90%",
    opacity:0.9
  });
})
