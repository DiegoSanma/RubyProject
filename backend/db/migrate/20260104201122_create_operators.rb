class CreateOperators < ActiveRecord::Migration[8.1]
  def change
    create_table :operators do |t|
      t.string :name
      t.string :side
      t.text :roles
      t.integer :health
      t.integer :speed

      t.timestamps
    end
  end
end
