class CreateChemistries < ActiveRecord::Migration[7.0]
  def change
    create_table :chemistries do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
