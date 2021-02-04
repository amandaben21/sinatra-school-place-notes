class Note < ActiveRecord::Base
    belongs_to :user
    validates :subject_name, :date, :note_entry presence: true
end
