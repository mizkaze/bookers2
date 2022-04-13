class RemoveIntroaFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :intro, :string
  end
end
