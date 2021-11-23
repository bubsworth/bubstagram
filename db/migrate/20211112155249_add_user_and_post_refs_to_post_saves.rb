class AddUserAndPostRefsToPostSaves < ActiveRecord::Migration[6.1]
  def change
    add_reference :post_saves, :user, null: false, foreign_key: true
    add_reference :post_saves, :post, null: false, foreign_key: true
  end
end
