class Course < ApplicationRecord
  belongs_to :user

  validates :title, :short_description, :language, :price, :level, presence: true
  validates :description, presence: true, length: { minimum: 5 }

  def to_s
    title
  end

  has_rich_text :description

  extend FriendlyId
  friendly_id :title, use: :slugged
end
