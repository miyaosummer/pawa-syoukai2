
$(function() {
  $('.signup__index__view').after('<span class= "signup__index__view__preview"></span>');

  // アップロードするファイルを選択
  $('input[type=file]').change(function() {
    var file = $(this).prop('files')[0];

    // 画像以外は処理を停止
    if (! file.type.match('image.*')) {
      // クリア
      $(this).val('');
      $('span').html('');
      return;
    }

    // 画像表示
    var reader = new FileReader();
    reader.onload = function() {
      var img_src = $('<img class="signup__index__view__preview__img">').attr('src', reader.result);
      $('span').html(img_src);
    }
    reader.readAsDataURL(file);
  });
});