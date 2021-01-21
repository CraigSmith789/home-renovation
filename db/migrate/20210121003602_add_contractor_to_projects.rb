class AddContractorToProjects < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :contractor, foreign_key: true
  end
end
