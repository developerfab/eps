class AddValuationToCites < ActiveRecord::Migration
  def change
    add_column :cites, :valuation, :boolean
    add_column :cites, :available, :boolean
  end
end
