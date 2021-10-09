class Course < ApplicationRecord
  include PublicActivity::Model
  # tracked
  tracked owner: proc { |controller, _model| controller.current_user }

  LANGUAGES = %w[English Russian Polish].freeze
  LEVELS = %w[Beginner Intermediate Advanced].freeze
  class << self
    def languages
      LANGUAGES.map { |language| [language, language] }
    end

    def levels
      LEVELS.map { |level| [level, level] }
    end
  end
  belongs_to :user
  has_many :lessons, dependent: :destroy

  validates :title, :short_description, :language, :price, :level, presence: true
  validates :description, presence: true, length: { minimum: 5 }

  def to_s
    title
  end

  has_rich_text :description

  extend FriendlyId
  friendly_id :title, use: :slugged
end
