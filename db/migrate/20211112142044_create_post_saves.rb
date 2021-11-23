class CreatePostSaves < ActiveRecord::Migration[6.1]
  def change
    create_table :post_saves do |t|
      t.boolean :saved, :default => false
      t.timestamps
    end
  end
end
