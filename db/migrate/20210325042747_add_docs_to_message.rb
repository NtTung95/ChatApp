class AddDocsToMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :docs, :string
  end
end
