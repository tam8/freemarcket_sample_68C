$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js_file_group__display" type="file"
                    name="item[item_images_attributes][${index}][image]"
                    id="item_item_images_attributes_${index}_image"><br>
                    <div class="js-remove">【削除】</div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('.image_form').on('change', '.js_file_group__display', function(e) {
    // fileIndexの先頭の数字を使ってinputを作る
    $('.image_form').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('.image_form').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js_file_group__display').length == 0) $('.image_form').append(buildFileField(fileIndex[0]));
  });
});





// 永井さんのやつ修正済み
// $(function(){

//   let buildFileField = (index) => {
    
//     const html = `<div class="js_file_group" data-index="${index}">
//                     <input class="js_file_group__display" type="file" 
//                     name="item[item_images_attributes][${index}][image]" 
//                     id="item_item_images_attributes_${index}_image">
//                     <div class="js-remove">削除</div>
//                   </div>`;
//                 return html;
//   }

//   let fileIndex = [1,2,3,4,5,6,7,8,9,10];

//   $('.image_form').on('change', '.js_file_group__display', function(e) {
//     $('.image_form').append(buildFileField(fileIndex[0]));
//     fileIndex.shift();
//     // 末尾の数に1足した数を追加する
//     fileIndex.push(fileIndex[fileIndex.length -1] +1)
//   });
// })