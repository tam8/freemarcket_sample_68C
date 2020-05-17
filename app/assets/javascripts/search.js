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
        
        if (items.length !== 0) {
          items.forEach(function (item) {
            addItem(item);
          });
        } else if (input.length == 0) {
          return false;
        } else {
          addNoItem();
        }
      })
      .fail(function() {
        alert("通信エラーです。商品が表示できません。")
      });
  });
});