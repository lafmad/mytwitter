class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :micropost
  default_scope order:'comments.created_at ASC'
  validates :micropost_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true
end
