class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :destroy, Recipe do |recipe|
        recipe.user_id == user.id
      end
      can :update, Recipe do |recipe|
        recipe.user_id == user.id
      end
      can :read, :all
    end
  end
end
