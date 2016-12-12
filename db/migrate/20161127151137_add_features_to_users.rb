class AddFeaturesToUsers < ActiveRecord::Migration
  def change
     add_column :users, :type, :string
     add_column :users, :last_name, :string
     add_column :users, :document, :string
     add_column :users, :position, :string
     add_column :users, :gender, :string
     add_column :users, :birthdate, :datetime
     add_column :users, :phone, :string
  end
end
