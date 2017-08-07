class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :league, null: false, index:true

      t.timestamps
    end
  end
end
