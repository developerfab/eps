class CreateBill < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.references :cite, references: :cite
      t.string :amount 
      t.timestamps
    end
  end
end
