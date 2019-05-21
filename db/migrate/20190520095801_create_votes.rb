class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :voteable_id
      t.string :voteable_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
