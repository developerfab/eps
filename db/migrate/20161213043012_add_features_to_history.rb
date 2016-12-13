class AddFeaturesToHistory < ActiveRecord::Migration
  def change
    enable_extension "hstore"
    add_column :histories, :valuation_format, :hstore
    add_column :histories, :evolution_format, :hstore
    add_column :histories, :format_not_pos, :hstore
  end
end
