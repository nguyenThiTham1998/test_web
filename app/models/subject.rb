class Subject < ApplicationRecord
	belongs_to :user
	belongs_to :sub_category
	has_many :questions
	validates :name, presence: true, length: { maximum: 200 }
	validates :description, length: { maximum: 1000 }
	validates :time, numericality: { only_integer: true }
	validate :start_at_cannot_be_in_the_past
  validate :end_at_after_start_at

  private

  def start_at_cannot_be_in_the_past
    if start_at.present? && start_at < DateTime.now - 1.0/(24*60)
      errors.add(:start_at, "can't be in the past")
    end

  end   

  def end_at_after_start_at
    return if end_at.blank? || start_at.blank?

    if end_at < start_at
      errors.add(:end_at, "must be after the start time")
    end
  end

end


	
 
    