class Note < ActiveRecord::Base
    belongs_to :user
    validates :subject_name, :date, presence: true
end
