class AddEventIdToDishes < ActiveRecord::Migration[5.2]
  def change
    add_column :dishes, :event_id, :integer
  end
end
