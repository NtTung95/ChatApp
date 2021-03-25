class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    html = ApplicationController.render(
      partial: 'messages/send_message',
      locals: { message: message }
    )
    html2 = ApplicationController.render(
      partial: 'messages/to_message',
      locals: { message: message }
    )
    ActionCable.server.broadcast "#{$name}", { message: message, html: html, html2: html2 }
  end
end
