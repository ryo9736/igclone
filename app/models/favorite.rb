class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :post
    paginates_per 1
end
