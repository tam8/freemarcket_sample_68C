$(function(){
  function addItem(item) {
    let html = `
    <div class="category-lists">
      <a href="/items/${item.id}"><img class="lists__image--img" src="${item.item_images.image.url}">
        <div class="category-lists__box">
          <h3 class="category-lists__name">
            ${item.name}
          </h3>
          <div class="category-lists__price-box">
            <ul class="price">
              <li class="price-list">
                ${item.price}円
              </li>
              <li class="favorite">
                <i class="fas fa-star icon_favorite"></i>
                  0
              </li>
            </ul>
            <p class="tax">
              (税込)
            </p>
          </div>
        </div>
      </a>
    </div>
    `;
    $(".category-pickup__lists-box").append(html);
  }

  function addNoItem() {
    let html = `
        <p>商品が見つかりません。</p>
    `;
    $(".category-pickup__lists-box").append(html);
  }

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
        console.log(items)
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