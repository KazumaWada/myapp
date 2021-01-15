class RemoveCommentFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :comment, :string
  end
end
