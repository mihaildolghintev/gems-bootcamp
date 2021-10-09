class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    @user.has_role?(:admin) or record.course.user_id == @user.id
  end

  def edit?
    @user.has_role?(:admin) or record.course.user_id == @user.id
  end

  def update?
    @user.has_role?(:admin) or record.course.user_id == @user.id
  end

  def new?; end

  def create?; end

  def destroy?
    @user.has_role?(:admin) or record.course.user_id == @user.id
  end
end
