$(function() {
    $("ul.category1, ul.category2, ul.category3").hide();
    $(".head__in__nav__left__cate").hover(function() {
      $("ul.category1").toggle();
    });
    $("ul.category1 li").hover(function() {
        $(">ul:not(:animated)", this).toggle();
  });
});