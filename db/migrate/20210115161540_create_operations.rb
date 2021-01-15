class CreateOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :operations do |t|
      t.references :surgery, foreign_key: true
      t.references :doctor, foreign_key: true
    end
  end
end
