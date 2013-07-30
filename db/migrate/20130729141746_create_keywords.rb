class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :value
      t.string :brand
      t.string :category
      t.string :target_url

      t.timestamps
    end
  end
end
