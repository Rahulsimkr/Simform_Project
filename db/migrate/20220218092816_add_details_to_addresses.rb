class AddDetailsToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :user, polymorphic: true
  end
end
