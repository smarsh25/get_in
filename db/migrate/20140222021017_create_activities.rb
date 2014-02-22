class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :body
      t.belongs_to :category, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
