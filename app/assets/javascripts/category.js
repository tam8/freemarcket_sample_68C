$(function() {
    $(".category-wrap").hover(function() {
      $("ul.category1").toggle();
    });
    $(".category-wrap li ul").hide();
    $(".category-wrap li").hover(function() {
        $(">ul:not(:animated)", this).stop(true, true).slideDown("fast");
        $(">a", this).addClass("active");
    }, function() {
        $(">ul:not(:animated)", this).stop(true, true).slideUp("fast");
        $(">a", this).removeClass("active");
  });
});