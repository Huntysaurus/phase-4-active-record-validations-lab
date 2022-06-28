class Post < ApplicationRecord
    validate :clickbait?
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: ["Fiction", "Non-Fiction"]

    BAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]

  def clickbait?
    if BAIT_PATTERNS.none? { |pattern| pattern.match(title) }
      errors.add(:title, "must be clickbait")
    end
  end

end
