class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.integer :email
      t.integer :no_of_order
      t.string :full_time_available
      t.integer :salary

      t.timestamps
    end
  end
end
