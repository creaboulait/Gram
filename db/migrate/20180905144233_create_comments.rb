class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|

    	t.string :description
    	t.belongs_to :user
    	t.belongs_to :pic
      t.timestamps
    end
  end
end
