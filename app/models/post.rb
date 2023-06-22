class Post < ApplicationRecord
    validates :title, presence: true
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validates :content, length: { minimum: 100 }
    validate :sufficiently_clickbait_title
  
    private
  
    def sufficiently_clickbait_title
      unless title.present? && title.match?(/Won't Believe|Secret|Top \d+|Guess/)
        errors.add(:title, "must be sufficiently clickbait-y")
      end
    end
  end
  