class AddVotingToVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :up, :boolean, defaul: nil
    add_column :votes, :down, :boolean, defaul: nil
  end
end
