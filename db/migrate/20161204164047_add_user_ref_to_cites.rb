class AddUserRefToCites < ActiveRecord::Migration
  def change
    add_reference :users, :cite, foreign_key: true
  end
end
