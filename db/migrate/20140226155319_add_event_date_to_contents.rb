class AddEventDateToContents < ActiveRecord::Migration
  def change
    add_column :contents, :eventdate, :timestamp
  end
end
