class DropTablecontractorsProjects < ActiveRecord::Migration[6.1]
  def change
    drop_table :contractors_projects
  end
end
