class AddForeignKey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :homes, :users
    add_foreign_key :projects, :homes
  end
end
