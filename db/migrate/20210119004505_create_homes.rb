class CreateHomes < ActiveRecord::Migration[6.1]
  def change
    create_table :homes do |t|
      t.string :name
      t.integer :year_built
      t.integer :sf
      t.integer :beds
      t.integer :baths
      t.timestamps
    end
  end
end
