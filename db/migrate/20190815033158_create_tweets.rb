class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.text :text, null: false
      t.references :user, index: true
      t.timestamps
    end
  end
end
