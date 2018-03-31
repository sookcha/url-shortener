class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.string :url_id

      t.timestamps
    end
  end
end
