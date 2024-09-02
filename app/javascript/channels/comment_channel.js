import consumer from "channels/consumer"

if(location.pathname.match(/\/items\/\d/)){

  // サーバーから送られてきた@itemの情報を元に、それぞれの商品に紐づいたチャネルを使用するよう定義。
consumer.subscriptions.create({
  channel: "CommentChannel",
item_id: location.pathname.match(/\d+/)[0]
},{
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // 受け取った情報を含んだhtmlの作成し変数htmlに代入
    const html = `
    <div class="comment">
      <p class="user-info">${data.user.nickname}: </p>
      <p>${data.comment.text}</p>
    </div>`
    const comments = document.getElementById("comments")
    // コメント欄の最後尾としてコメントを追加
    comments.insertAdjacentHTML('beforeend', html)
    const commentForm = document.getElementById("comment-form")
    commentForm.reset();
  }
});
}

