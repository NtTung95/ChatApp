class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    html = "<div class=" + "message mb-3 me" + ">
            <div class=" + "content-container" + ">
              <div class=" + "content" + ">
                #{message.content}
              </div>
            </div>
          </div>"
    ActionCable.server.broadcast("#{$name}", {html: html})
  end
end
