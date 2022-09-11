class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
        max = self.reviews.maximum(:star_rating)
        self.reviews.find_by(star_rating: max).product
    end

    def remove_reviews(product)
        self.reviews.destroy_by(product: product)
    end
end
