class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.belongs_to :activity, index: true
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
