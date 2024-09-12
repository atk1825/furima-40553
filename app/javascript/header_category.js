document.addEventListener('DOMContentLoaded', function() {
  const categoryTrigger = document.querySelector('.category_list');
  const parentCategories = document.getElementById('parent_categories');
  
  // Show parent categories when hovering over the "カテゴリー" div
  categoryTrigger.addEventListener('mouseover', function() {
      if (parentCategories.getAttribute("style") == "display:block;"){
        parentCategories.removeAttribute("style")
      } else {
        parentCategories.setAttribute("style", "display:block;")
      }
  });
  
  parentCategories.addEventListener('mouseover', function() {
      parentCategories.style.display = 'block';
  });

  parentCategories.addEventListener('mouseout', function() {
      parentCategories.style.display = 'none';
  });

  // Handling nested categories (child and grandchild categories)
  const parentListItems = parentCategories.querySelectorAll('li');

  parentListItems.forEach(parentCategory => {
      const childList = parentCategory.querySelector('.category__child');
      if (childList) {
          parentCategory.addEventListener('mouseenter', function() {
              childList.style.display = 'block';
          });
          parentCategory.addEventListener('mouseleave', function() {
              childList.style.display = 'none';
          });

          const childListItems = childList.querySelectorAll('li');
          childListItems.forEach(childCategory => {
              const grandchildList = childCategory.querySelector('.category__child');
              if (grandchildList) {
                  childCategory.addEventListener('mouseenter', function() {
                      grandchildList.style.display = 'block';
                  });
                  childCategory.addEventListener('mouseleave', function() {
                      grandchildList.style.display = 'none';
                  });
              }
          });
      }
  });
});
