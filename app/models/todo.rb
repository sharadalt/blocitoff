class Todo < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
    
  def due_date
    created_at + 7.days     
  end
end
