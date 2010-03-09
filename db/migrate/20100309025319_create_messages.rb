class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.references :chat
      t.references :author
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
