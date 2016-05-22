class Card < ActiveRecord::Base
	validates :question, presence: true
	validates :answer, presence: true
	validates :notes, presence: true
end