class CreateCommunes < ActiveRecord::Migration
  def change
    create_table :communes do |t|
      t.string :name
      t.string :code
      t.integer :inhabitants

      t.timestamps null: false
    end
  end
end
