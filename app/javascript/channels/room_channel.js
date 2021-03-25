import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
    connected() {
        console.log("Connect to ...")
    },

    disconnected() {
        // Called when the subscription has been terminated by the server
    },

    received(data) {
        const current_id = parseInt(document.getElementById('user-id').value)
        const user_id = data.message.user_id
        if (user_id !== current_id) {
            $(`<div class="message">
            <div class="content_container">
              <small class="text-muted">${data.username}</small>
              <div class="content">
                 ${data.message.content}
              </div>
            </div>
          </div>`).appendTo('div.chat-room')
        } else if (user_id === current_id) {
            $(`<div class="message me">
            <div class="content_container">
              <div class="content">
                 ${data.message.content}
              </div>
            </div>
          </div>`).appendTo('div.chat-room')
        }
        document.getElementById('message_content').value = ""
        document.getElementById('message_docs').value = ""
        $('#chat-room').scrollTop($('#chat-room')[0].scrollHeight);
    }
});
