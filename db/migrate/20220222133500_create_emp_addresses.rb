class CreateEmpAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :emp_addresses do |t|
      t.string :quarter_number
      t.string :street_name
      t.string :sector
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
