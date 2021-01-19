class DropTablehome < ActiveRecord::Migration[6.1]
  def change
    drop_table :homes
  end
end
