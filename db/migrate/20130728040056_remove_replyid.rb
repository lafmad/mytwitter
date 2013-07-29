class RemoveReplyid < ActiveRecord::Migration
  def up
  	remove_column("comments","reply_id")
  end

  def down
  	add_column("comments","reply_id",:integer)
  end
end
