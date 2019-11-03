class CreateWebhooks < ActiveRecord::Migration[6.0]
  def change
    create_table :webhooks do |t|
      t.string :name
      t.string :url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
