class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string     :title,   null: false
      t.text       :content, null: false
      t.belongs_to :user,    null: false, foreign_key: true

      t.timestamps
    end
  end
end