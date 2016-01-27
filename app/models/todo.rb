class Todo < ActiveRecord::Base
    belongs_to :user
    validates :user_id, presence: true
    enum finish_status: ['no', 'yes']
end
