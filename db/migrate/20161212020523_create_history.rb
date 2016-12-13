class CreateHistory < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.references :user, index: true, foreign_key: true, reference: :user
    end
  end
end
