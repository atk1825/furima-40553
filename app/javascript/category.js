window.addEventListener('turbo:load', function(){
  const parentCategory = document.getElementById('item-category')
  const selectWrap = document.getElementById('select-wrap')
  const selectChildElement = (selectForm) => {

  }

  // Ajax通信を可能にする
  const XHR = new XMLHttpRequest();
  const categoryXHR = (id) => {
    XHR.open("GET", `/category/${id}`, true);
    XHR.responseType = "json";
    XHR.send();
  }

  // 子カテゴリーの値を全て取得する。
  const getChildCategoryData = () => {
    const parentValue = parentCategory.value
    categoryXHR(parentValue)

    // コントローラーからjson形式でレスポンスの受信が成功した時に、onloadが発火する
    XHR.onload = () => {
      const items = XHR.response.item;
      appendChildSelect(items)
      const childCategory = document.getElementById('child-select')

      // 子カテゴリーの値が変化すると孫カテゴリーの選択フォームが表示される。
      childCategory.addEventListener('change', () => {
        selectChildElement('grand-child-select-wrap')
        getGrandchildCategoryData(childCategory)
      })
    }
  }
  // 下記は https://gyazo.com/423164303e1b1cd8876a6e6fcb87d9b0 を作る工程
  const appendChildSelect = (items) => {
    const childWrap = document.createElement('div')
    const childSelect = document.createElement('select')

    childWrap.setAttribute('id', 'child-select-wrap')
    childSelect.setAttribute('id', 'child-select')

    items.forEach(item => {
      const childOption = document.createElement('option')
      childOption.innerHTML = item.name
      childOption.setAttribute('value', item.id)
      childSelect.appendChild(childOption)
    });

    childWrap.appendChild(childSelect)
    selectWrap.appendChild(childWrap)
  }
  // ここまで。

  // 親カテゴリーを選択した後に発火するイベント。
  parentCategory.addEventListener('change', function(){
    selectChildElement('child-select-wrap')
    getChildCategoryData()
  })
})