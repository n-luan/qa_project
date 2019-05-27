class RemoveClientFromTags < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tags, :category, foreign_key: true
  end
end
