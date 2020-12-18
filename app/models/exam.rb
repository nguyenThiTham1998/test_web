class Exam < ApplicationRecord
  belongs_to :subject
  has_many :detail_exams
  has_many :answers, :through => :detail_exams
  accepts_nested_attributes_for :detail_exams
end
