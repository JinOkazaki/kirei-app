import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
      const date = new Date()
      const Y = date.getFullYear()
      const M = ("00" + (date.getMonth()+1)).slice(-2)
      const D = ("00" + date.getDate()).slice(-2)
      const h = ("00" + date.getHours()).slice(-2)
      const m = ("00" + date.getMinutes()).slice(-2)
      if (data.message.message == "") {
        alert("メッセージを入力してください!");
      } else {
        const currentUserId = document.getElementById("chat-room").dataset.userId;
        const htmlClass = currentUserId == data.message.user_id ? "mycomment" : "another"
        const html = `
            <div class="chat-hukidashi ${htmlClass}">
              <div class="current-message-time">
                <span class="time">${Y}/${M}/${D} ${h}:${m}</span>
                <span class="current-message">${data.message.message}</span>
              </div>
            </div>`;
        const messages = document.getElementById('message-list');
        const newMessage = document.getElementById('message-form');
        messages.insertAdjacentHTML('beforeend',html);
        newMessage.value = '';
      };
  }
});


