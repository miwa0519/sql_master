class CreateUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :units do |t|
      t.references :subject, null: false, foreign_key: true
      t.references :parent_unit, foreign_key: { to_table: :units }
      t.string :name

      t.timestamps
    end
  end
end
