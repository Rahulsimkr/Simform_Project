class AddEmployeeRefToEmpAddress < ActiveRecord::Migration[7.0]
  def change
    add_reference :emp_addresses, :employee, null: false, foreign_key: true
  end
end
