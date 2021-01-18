class CreateJoinTableContractorProject < ActiveRecord::Migration[6.1]
  def change
    create_join_table :contractors, :projects do |t|
      # t.index [:contractor_id, :project_id]
      # t.index [:project_id, :contractor_id]
    end
  end
end
