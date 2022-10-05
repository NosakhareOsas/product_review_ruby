class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def leave_review(user, star_rating, comment)
        Review.create(star_rating: star_rating, comment: comment, user: user, product: self)
    end

    def print_all_reviews
        self.reviews.each do |review|
            review.print_review
        end
    end
    
    def average_rating
        self.reviews.average(:star_rating).to_f
    end
####for movie code challenge
    def self.most_successful
        all_salaries={}
        self.all.each{ |actor| all_salaries[actor.id]= actor.total_salary}
        highest_id = all_salaries.max_by{|k,v| v}[0]
        self.all.find(highest_id)
    end
end