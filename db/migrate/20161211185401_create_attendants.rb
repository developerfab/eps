class CreateAttendants < ActiveRecord::Migration
  def change
    create_table :attendants do |t|
      t.references :user, index: true, foreign_key: true
      t.string :document, null: false
      t.string :name, null: false
      t.string :last_name, null: false
      t.string :address
      t.string :relationship
      t.string :phone, null: false
    end
  end
end
