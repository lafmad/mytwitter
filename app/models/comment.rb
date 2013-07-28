class Comment < ActiveRecord::Base
  attr_accessible :content,:micropost_id,:user_id,:commentfrom_id,:commentto_id
  belongs_to :micropost
  default_scope order:'comments.created_at ASC'
  validates :micropost_id, presence: true
  validates :content, presence: true
end
