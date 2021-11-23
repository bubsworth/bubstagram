class ChangePostSavesToCollects < ActiveRecord::Migration[6.1]
  def change
    rename_table :post_saves, :collects
  end
end
