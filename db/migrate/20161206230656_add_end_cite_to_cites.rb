class AddEndCiteToCites < ActiveRecord::Migration
  def change
    add_column :cites, :end_cite, :datetime
  end
end
