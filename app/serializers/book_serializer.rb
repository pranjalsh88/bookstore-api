# app/serializers/book_serializer.rb

class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :price
  belongs_to :author
  belongs_to :publisher
end