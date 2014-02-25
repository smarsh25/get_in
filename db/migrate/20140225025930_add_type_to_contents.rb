class AddTypeToContents < ActiveRecord::Migration
  def change
    add_column :contents, :kind, :string
  end
end
