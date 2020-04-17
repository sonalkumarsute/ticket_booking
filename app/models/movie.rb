class Movie < ApplicationRecord
  has_many :showings, class_name: "Show"
end
