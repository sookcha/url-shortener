class DeleteVisitOnLink < ActiveRecord::Migration[5.1]
  def change
    remove_column :links, :visit
  end
end
