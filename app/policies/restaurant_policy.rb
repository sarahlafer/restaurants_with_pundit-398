class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def new?
  #   true
  # end

  def create?
    true
  end

  def show?
    true
  end

  # def edit?
  #   # If the user is the owner of the restaurant => true
  #   # Otherwise => false
  #   # user => current_user
  #   # record => @restaurant (argument passed to 'authorize')
  #   user == record.user
  #   is the same as:
  #   if user == record.user
  #     return true
  #   else
  #     return false
  #    end
  # end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    user == record.user || user.admin
  end
end






