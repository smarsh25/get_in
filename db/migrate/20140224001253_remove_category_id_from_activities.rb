class RemoveCategoryIdFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :category_id, :integer
  end
end
