class Lesson < ApplicationRecord
  extend FriendlyId
  include PublicActivity::Model
  belongs_to :course

  validates :title, :content, :course, presence: true

  friendly_id :title, use: :slugged
  tracked owner: proc { |controller, _model| controller.current_user }

  has_rich_text :content

  def to_s
    title
  end
end
