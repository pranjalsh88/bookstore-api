# app/models/publishing_house.rb

class PublishingHouse < ApplicationRecord
  has_many :published, as: :publisher, foreign_key: :publisher_id, class_name: 'Book'
end