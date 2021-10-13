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
                <span>${data.message.created_at}</span>
                <span>${data.message.message}</span>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message-form');
    messages.insertAdjacentHTML('afterend',html);
    newMessage.value = '';
  }
});
