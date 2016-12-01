class AddServicesToCites < ActiveRecord::Migration
  def change
    add_reference :cites, :service, index: true
  end
end
