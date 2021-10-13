import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
            <div class="current-message-time">
              <div class="chat-hukidashi">
                <span class="time">${data.message.created_at}</span>
                <span class="current-message">${data.message.message}</span>
              </div>
            </div>`;
    const messages = document.getElementById('message-list');
    const newMessage = document.getElementById('message-form');
    messages.insertAdjacentHTML('afterend',html);
    newMessage.value = '';
  }
});
