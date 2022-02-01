class ChangeDepartmentToBeStringStudents < ActiveRecord::Migration[7.0]
  def up
     change_column :students, :department, :string
  end
  def down 
    change_column :students, :department, :boolean
  end
end

