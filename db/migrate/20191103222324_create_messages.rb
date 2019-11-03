class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.datetime :send_at
      t.string :message
      t.references :webhook, null: false, foreign_key: true

      t.timestamps
    end
  end
end
