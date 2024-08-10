document.addEventListener('turbo:load', function(){
  //  新規投稿・編集ページのフォームを取得
  const itemForm = document.getElementById('new_item');
  //  プレビューを表示するための場所を取得
  const previewList = document.getElementById('previews');
  //  新規投稿・編集ページのフォームがない場合はここで終了。！は論理否定演算子
  if (!itemForm) return null;

  //  input要素を取得。「検証」で確認をする
  const fileField = document.querySelector('input[type="file"][name="item[image]"]');

  //  'change'でインプット要素に変化があった時に呼び出される関数
  fileField.addEventListener('change', function(e){

    // 古いプレビューがある場合は削除
    const alreadyPreview = document.querySelector('.preview');
    if (alreadyPreview){
      alreadyPreview.remove();
    };

    const file = e.target.files[0];
    //  fileのURLを作成
    const blob = window.URL.createObjectURL(file);
    
    //  画像を表示するためのdiv要素を生成
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');

    // 表示する画像を生成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob, );
    previewImage.setAttribute('width', '150px');
    previewImage.setAttribute('height', '150px');

    // 生成したHTMLの要素をブラウザに表示させる。下記の場合<div><img></div>となる
    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
  });
})