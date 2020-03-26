class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :starttime
      t.datetime :endtime
      t.string :organizeremail
      t.string :organizertelegram
      t.string :link

      t.timestamps
    end
  end
end