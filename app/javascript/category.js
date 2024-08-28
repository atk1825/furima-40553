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

  // 下記、孫カテゴリーの実装。
  const getGrandchildCategoryData = (grandchildCategory) => {
    const grandchildValue = grandchildCategory.value
    categoryXHR(grandchildValue)

    XHR.onload = () => {
      const GrandChildItems = XHR.response.item;
      appendGrandChildSelect(GrandChildItems)
    }
  }

  const appendGrandChildSelect = (items) => {
    const childWrap = document.getElementById('child-select-wrap')
    const grandchildWrap = document.createElement('div')
    const grandchildSelect = document.createElement('select')

    grandchildWrap.setAttribute('id', 'grand-child-select-wrap')
    grandchildSelect.setAttribute('id', 'grand-child-select')

    items.forEach(item => {
      const grandchildOption = document.createElement('option')
      grandchildOption.innerHTML = item.name
      grandchildOption.setAttribute('value',item.id)
      
      grandchildSelect.appendChild(grandchildOption)
    });
      
    grandchildWrap.appendChild(grandchildSelect)
      childWrap.appendChild(grandchildWrap)

  }
  // ここまで。

  // 親カテゴリーを選択した後に発火するイベント。
  parentCategory.addEventListener('change', function(){
    selectChildElement('child-select-wrap')
    getChildCategoryData()
  })
})