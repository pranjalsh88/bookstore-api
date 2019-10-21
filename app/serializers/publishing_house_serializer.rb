# app/serializers/publishing_house_serializer.rb

class PublishingHouseSerializer < ActiveModel::Serializer
  attributes :id, :name, :discount
  has_many :published
end