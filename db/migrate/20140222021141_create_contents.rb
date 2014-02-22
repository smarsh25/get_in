class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.belongs_to :activity, index: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
