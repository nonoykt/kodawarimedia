class ChangeMicropostsContentNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column :microposts, :content, :text, null: false
  end

  def down
    change_column :microposts, :content, :text
  end
end
