import consumer from "channels/consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    console.log('Hello from')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('#message-container').append(data.mod_message);
    $('#messages').scrollTop($('#messages')[0].scrollHeight);
    $("#message_body").val("");
  }
});
