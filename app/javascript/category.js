window.addEventListener('turbo:load', function(){
  const parentCategory = document.getElementById('item-category')
  const selectChildElement = (selectForm) => {

  }

  const XHR = new HMLHttpRequest();
  const categoryXHR = (id) => {
    XHR.open("GET", `/category/${id}`, true);
    XHR.responseType = "json";
    XHR.send();
  }
  const getChildCategoryData = () => {
    const parentValue = parentCategory.value
    categoryXHR(parentValue)
  }
  parentCategory.addEventListener('change', function(){
    selectChildElement('child-select-wrap')
    getChildCategoryData()
  })
})