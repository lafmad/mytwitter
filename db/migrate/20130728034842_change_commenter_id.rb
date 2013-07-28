class ChangeCommenterId < ActiveRecord::Migration
  def up
  	add_column("comments","commentfrom_id",:integer)
  	add_column("comments","commentto_id",:integer)
  	remove_column("comments","user_id")
  end

  def down
  	add_column("comments","user_id",:integer)
  	remove_column("comments","commentto_id")
  	remove_column("comments","commentfrom_id")
  end
end
