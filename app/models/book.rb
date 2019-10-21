# app/models/book.rb

class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher, polymorphic: true
end