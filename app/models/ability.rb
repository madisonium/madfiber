class Ability
  include CanCan::Ability

  def initialize user
    if user_signed_in? && current_user.has_role? 'admin'
      can :manage, :all
    else
      can :read, :all
      can :create, Pin
    end
  end
end
