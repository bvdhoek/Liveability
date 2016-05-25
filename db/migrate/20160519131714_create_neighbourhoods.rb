class CreateNeighbourhoods < ActiveRecord::Migration
  def change
    create_table :neighbourhoods do |t|
      t.string :liveability_score_2008
      t.string :liveability_score_2002
      t.string :liveability_score_2012
      t.string :liveability_score_2014
      t.string :houses_score_2012
      t.string :inhabitants_score_2012
      t.string :services_score_2012
      t.string :safety_score_2012
      t.string :fysical_environment_score_2012
      t.string :houses_score_2014
      t.string :inhabitants_score_2014
      t.string :services_score_2014
      t.string :safety_score_2014
      t.string :fysical_environment_score_2014
      t.references :commune, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
