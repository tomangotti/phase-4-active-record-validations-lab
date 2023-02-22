class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { :minimum => 250 }
    validates :summary, length: { :maximum => 250}
    validates :category, inclusion: ["Fiction", "Non-Fiction"]

    validate :clickbait?

    CLICKBAIT_PHRASE = [
        /Won't Believe/i,
        /Secrete/i,
        /Top \d/i,
        /Guess/i
    ]

    def clickbait?
        if CLICKBAIT_PHRASE.none? { |pat| pat.match title }
            errors.add(:title, "must be clickbait")
        end

    end

end
