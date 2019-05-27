class AddColumnUserToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :user_name, :string
    add_column :questions, :user_email, :string
  end
end
