class AddHomeToProjects < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :home, foreign_key: true
  end
end
