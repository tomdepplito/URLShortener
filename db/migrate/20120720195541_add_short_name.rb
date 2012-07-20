class AddShortName < ActiveRecord::Migration
  def change
    add_column(:links, :short_name, :string)
  end
end
