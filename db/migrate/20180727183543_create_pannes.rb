class CreatePannes < ActiveRecord::Migration[5.2]
  def change
    create_table :pannes do |t|
      t.text :description
      t.string :type_panne
      t.string :laboratoire
      t.string :type_Composant
      t.string :id_Composant
      t.references :prof
      t.references :tech
      t.text :tech_comment
      t.string :panne_status

      t.timestamps
    end
    add_index :pannes, [:prof_id, :created_at]
    add_index :pannes, [:tech_id, :created_at]
  end
end
