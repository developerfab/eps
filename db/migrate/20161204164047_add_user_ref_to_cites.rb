class AddUserRefToCites < ActiveRecord::Migration
  def change
    add_reference :users, :cite, foreign_key: true
    add_reference :users, :doctor, index: true
  end
end
