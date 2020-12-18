class Profile < ApplicationRecord
  belongs_to :user
  validate :date_of_birth_must_be_in_the_past
  validates :name, presence: true, length: { maximum: 100 }
  validates :more_detail, length: { maximum: 500 }

  private
  def date_of_birth_must_be_in_the_past
    if date_of_birth > DateTime.now 
      errors.add(:date_of_birth, "must be in the past")
    end
  end
end