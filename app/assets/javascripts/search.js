$(function(){
  $('.head__in__up__search__btn--display').on("click", function(e){
    let input = $('.head__in__up__search__txt').val();
    e.preventDefault();
    $.ajax({
      type: "GET",
      url: "/items/search",
      data: { keyword: input},
      dataType: "json"
    })
      .done(function(items) {
        $(".category-pickup__lists-box").empty();
        
      })
      .fail(function() {
        console.log("失敗です。");
      });
  });
});