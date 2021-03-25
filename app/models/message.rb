class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  mount_uploaders :docs, DocUploader
  serialize :docs, JSON # If you use SQLite, add this line.
end
