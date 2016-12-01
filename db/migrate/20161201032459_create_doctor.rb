class CreateDoctor < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.references :user, references: :user
      t.string :speciality
      t.string :medical_license
      t.string :schedule
      t.string :worked_days, array: true, default: []
      t.timestamps
    end
  end
end
