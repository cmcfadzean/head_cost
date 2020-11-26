class CreateSalaries < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.references :employee, foreign_key: true
      t.decimal :salary
      t.date :effective

      t.timestamps
    end
  end
end
