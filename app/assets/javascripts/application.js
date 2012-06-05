// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.effects.highlight
//= require twitter/bootstrap
//= require_tree .


jQuery(function($) {
  $('*[title]').tooltip();

  // events for bootstrap collapse elements
  $(".collapse").on('show', function () {
    $(this).prev("h2").find("a[data-toggle='collapse'] > i").removeClass().addClass('icon-arrow-right');
  });
  $(".collapse").on('hide', function () {
    $(this).prev("h2").find("a[data-toggle='collapse'] > i").removeClass().addClass('icon-arrow-down');
  });

  // removing a container element
  $("a[data-remove]").live('click', function () {
    $(this).parents($(this).data('parent')).first().remove();

    return false;
  });

  $("*[data-populate]").live('change', function () {
    source = $(this);
    container = source.parents(source.attr("data-populate-container")).first();
    target = container.find("select[data-populate-target]").first();

    $.ajax({
      url: source.data('populate'),
      data: {id: source.val()},
      dataType: "html"
    }).done(function (data) {
      target.html(data);
      target.effect('highlight', {color: "#ffc40d"}, 800);
    });
  });
});

function add_fields(link, association, target, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(target).append(content.replace(regexp, new_id));
}


