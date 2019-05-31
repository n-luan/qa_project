class AddCountToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :count_vote, :integer, default: 0
  end
end
