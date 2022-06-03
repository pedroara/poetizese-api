class Post < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user, optional: true
end
