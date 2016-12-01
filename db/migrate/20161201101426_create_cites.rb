class CreateCites < ActiveRecord::Migration
  def change
    create_table :cites do |t|
      t.references :patient, reference: :user
      t.references :doctor, reference: :doctor
      t.datetime :date_cite
      t.references :creator, reference: :user
      t.boolean :authorized
      t.timestamps
    end
  end
end
