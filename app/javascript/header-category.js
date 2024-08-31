document.addEventListener('DOMContentLoaded', () => {
  // カテゴリーリストアイテムの取得
  const categoryListItem = document.getElementById('category');

  // カテゴリーコンテナの取得
  const categoryContainer = document.getElementById('category-container');

  // カテゴリーデータのフェッチと表示
  fetch('/categories')
    .then(response => response.json())
    .then(categories => {
      categories.forEach(category => {
        const categoryElement = document.createElement('li');

        categoryElement.innerText = category.name;
        categoryContainer.appendChild(categoryElement);
      });
    });

  // カテゴリーリストアイテムにマウスオーバーした際の処理
  categoryListItem.addEventListener('mouseover', () => {
    categoryContainer.style.display = 'flex';
  });

  // マウスアウトした際の処理
  categoryListItem.addEventListener('mouseout', () => {
    categoryContainer.style.display = 'none';
  });
});
