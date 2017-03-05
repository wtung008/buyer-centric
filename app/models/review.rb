class Review < ApplicationRecord
  belongs_to :seller, class_name: "User"
  belongs_to :user
end
