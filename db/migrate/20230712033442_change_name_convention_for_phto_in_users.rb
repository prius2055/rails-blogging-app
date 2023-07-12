class ChangeNameConventionForPhtoInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :Photo, :photo
  end
end
