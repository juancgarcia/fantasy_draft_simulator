class CreateLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues do |t|
      t.string :name
      t.integer :round
      t.integer :drafting_index

      t.timestamps
    end
  end
end
