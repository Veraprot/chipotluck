class AddHostToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :user_host_id, :integer
  end
end
