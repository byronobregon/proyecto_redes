import consumer from "channels/consumer"

consumer.subscriptions.create("ServerStatusChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    var view = document.body.getAttribute('data-view')
    if (view === "index" || view === "show") {
      window.location.reload();
    } else {
      console.log("aquí no se refresca")
    }
    // Called when there's incoming data on the websocket for this channel
  }
});
