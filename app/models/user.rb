class User < ApplicationRecord
  rolify

  has_many :courses

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  after_create :assign_default_role

  validate :must_have_a_role, on: :update

  def to_s
    username
  end

  def username
    email.split(/@/).first
  end

  def assign_default_role
    if User.count == 1
      add_role(:admin) if roles.blank?
      add_role(:teacher)
      add_role(:student)
    else
      add_role(:student)
      add_role(:teacher)
    end
  end

  private

  def must_have_a_role
    errors.add(:roles, 'must have at least one role') unless roles.any?
  end
end
