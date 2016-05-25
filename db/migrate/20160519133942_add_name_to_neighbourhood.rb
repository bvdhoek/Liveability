class AddNameToNeighbourhood < ActiveRecord::Migration
  def change
    add_column :neighbourhoods, :name, :string
  end
end
