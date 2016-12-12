class CreateAdditionalInformationUsers < ActiveRecord::Migration
  def change
    create_table :additional_information_users do |t|
      t.references :user, index: true, foreign_key: true, references: :user
      t.string :blood_type, null: false
      t.string :civil_status, null: false
      t.string :occupation
      t.string :live_with, array: true, default: []
      t.string :religion
      t.string :companion
      t.string :place_of_birth
      t.string :state
      t.string :municipality
      t.string :city
      t.string :address
      t.string :cellphone
      t.string :ethnicity
      t.string :education_level
    end
  end
end
