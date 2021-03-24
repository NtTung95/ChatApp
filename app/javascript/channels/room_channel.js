import consumer from "./consumer"


consumer.subscriptions.create("RoomChannel", {
    connected() {
        console.log("Connect to ...")
    },

    disconnected() {
        // Called when the subscription has been terminated by the server
    },

    received(data) {
        // Called when there's incoming data on the websocket for this channel
        $(`<div class="message col-12 mb-3 me">
            <div class="content_container">
              <div class="content">
                 ${data.content}
              </div>
            </div>
          </div>`).appendTo('div.chat-room')
        document.getElementById('message_content').value = ""
    }
});
