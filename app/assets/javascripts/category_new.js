$(function (){

  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`
    return html;
  }

  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class="category__top__wrapper--added" id= "children_wrapper" >
                         <select class="category__form__child" id="child_category" name="">
                           <option value="---">✔︎ 選択してください</option>
                             ${insertHTML}
                         </select>
                       </div>`;
    $('.category__top').append(childSelectHtml);
  }

  function appendGrandchildrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class="category__top__wrapper--added" id= "grandchildren_wrapper" >
                             <select class="category__form__child" id="grandchild_category" name="item[category_id]">
                               <option value="---">✔︎ 選択してください</option>
                                 ${insertHTML}
                             </select>
                            </div>`;
    $('.category__top').append(grandchildSelectHtml);
  }

  $("#item_category_id").on('change', function(e) {
    var parentId = $(this).val();
    if (parentId != "") {
      $.ajax({
        url: 'category_children',
        type: 'GET',
        data: { parent_id: parentId },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove(); 
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        })
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました')
      })
    }else{
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove(); 
    };
  });

  $('.category__top').on('change', '#child_category', function(){
    var childId = $(this).val();
    if (childId != "") {
      $.ajax({
        url: 'category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType:'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove(); 
    }
  });
});