// インクリメンタルリサーチ（文書入力の度に、自動的に検索が行われる検索機能）
document.addEventListener("turbo:load", () => {
  const tagNameInput = document.querySelector("#item_form_tag_name");
  if (tagNameInput){
    const inputElement = document.getElementById("item_form_tag_name");
    inputElement.addEventListener("input", () => {
      const keyword = document.getElementById("item_form_tag_name").value;
      const XHR = new XMLHttpRequest();
      // リクエスト定義のためにopenメソッドを使用。引数(HTTPメソッド、URL、非同期通信)。keywordは６行目のフォームから取得した文字列。
      XHR.open("GET", `/items/search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();

      XHR.onload = () => {
        // search-resultと言う名のid要素を取得
        const searchResult = document.getElementById("search-result");
        // 検索結果に複数の同じタグが表示されるのを解消。
        searchResult.innerHTML = "";
        if (XHR.response){
          const tagName = XHR.response.keyword;
          // 検索結果があるだけ繰り返す以下を繰り返す。
          tagName.forEach((tag) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", tag.id);
            childElement.innerHTML = tag.tag_name;
            // 上記の内容をappendChildを使ってchildElementをsearchResultに挿入
            searchResult.appendChild(childElement);
            // タグをクリックするとフォームに入力し、選択されたタグを削除する
            const clickElement = document.getElementById(tag.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("item_form_tag_name").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    });
  };
});