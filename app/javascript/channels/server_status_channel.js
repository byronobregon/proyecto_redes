import consumer from "channels/consumer"

consumer.subscriptions.create("ServerStatusChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    window.location.reload();
    // Called when there's incoming data on the websocket for this channel
  }
});
