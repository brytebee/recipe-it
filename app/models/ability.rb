class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :show, Recipe do |recipe|
        recipe.user_id == user.id
      end
      can :destroy, Recipe do |recipe|
        recipe.user_id == user.id
      end
      can :update, Recipe do |recipe|
        recipe.user_id == user.id
      end
      can :destroy, Food do |food|
        food.user_id == user.id
      end
      can :update, Food do |food|
        food.user_id == user.id
      end
      can :read, :all
      can :create, :all
    end
  end
end
