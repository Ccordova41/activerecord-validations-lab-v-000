class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
  message: "%{value} is not a valid category" }, allow_nil: true

  validate :is_clickbait?

  CLICKBAITS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]+/i,
    /Guess/i
    ]

    def is_clickbait?
      if CLICKBAITS.none? { |bait| bait.match title }
       errors.add(:title, "this is not clickbait!")
     end
   end

end
