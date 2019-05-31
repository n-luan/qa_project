class AddCountToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :count_vote, :integer, default: 0
  end
end
