class CreateIssues < ActiveRecord::Migration[7.1]
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.integer :priority
      t.string :status
      t.integer :assigned_to
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
