class DetailExam < ApplicationRecord
  belongs_to :exam
  belongs_to :answer
end
