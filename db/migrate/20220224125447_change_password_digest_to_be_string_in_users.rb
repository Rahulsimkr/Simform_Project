class ChangePasswordDigestToBeStringInUsers < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :password_digest, :string
  end
  def def down 
    def change
      change_column :users, :password_digest, :text
    end
  end
end
