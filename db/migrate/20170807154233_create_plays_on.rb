class CreatePlaysOn < ActiveRecord::Migration[5.1]
  def change
    create_table :plays_ons do |t|
      t.references :player, index: true, foreign_key: true, null: false
      t.references :team, index: true, foreign_key: true, null: false
    end
  end
end
