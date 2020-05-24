$(document).on('turbolinks:load', ()=> {
  //タグ生成用関数
    // 画像用のinputを生成する関数
    const buildFileField = (index)=> {
      const html = `<div data-index="${index}" class="js_file_group">
                      <i class="fas fa-minus-circle js-remove"></i>
                      <input class="js_file_group__display" type="file"
                      name="item[item_images_attributes][${index}][image]"
                      id="item_item_images_attributes_${index}_image">
                    </div>`;
      return html;
    }

    // プレビューimgタグを生成する関数
    const buildImg = (index, url)=> {
      const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
      return html;
    }

  // 変数定義
    // file_fieldのnameに動的なindexをつける為の配列
    let fileIndex = [1,2,3,4,5,6,7,8,9,10];

    // 使用済みのindexを削除 (新規追加のため)
    lastIndex = $('.js-file_group:last').data('index');
    fileIndex.splice(0, lastIndex);


  // 削除用チェックボックスを非表示
  $('.hidden-destroy').hide();


  // 処理部分
    //画像入稿部分で変更があった際
      $('.image_form').on('change', '.js_file_group__display', function(e) {

        // ターゲットとなるindexを取得
        const targetIndex = $(this).parent().data('index');
        const file = e.target.files[0];

        const blobUrl = window.URL.createObjectURL(file);

        // 該当indexのimgがあれば変数imgに入れる(画像変更の処理)
        if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
          img.setAttribute('src', blobUrl);
        } else {  // 新規画像追加の処理
          $('.image_preview').append(buildImg(targetIndex, blobUrl));

        // fileIndexの先頭の数でinputを生成
        $('.image_form').append(buildFileField(fileIndex[0]));
        fileIndex.shift();

        // 末尾に1足した数を追加
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
      });


    // 削除ボタンを押した際
      $('.image_form').on('click', '.js-remove', function() {

        // ターゲットとなるindexを取得
        const targetIndex = $(this).parent().data('index')
        const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);

        // もしチェックボックスが存在すればチェックを入れる
        if (hiddenCheck) hiddenCheck.prop('checked', true);

        $(this).parent().remove();

        // 入力欄が0個にならないように
        if ($('.js_file_group__display').length == 0) $('.image_form').append(buildFileField(fileIndex[0]));

        // プレビュー画像の削除
        $(`img[data-index="${targetIndex}"]`).remove();

      });

});



