class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
      cannot :edit, User do |user_account|
        user_account != user
      end
    elsif user.mod?
      can :manage, :all
      cannot :update, User
      cannot :destroy, User do |account|
        account.mod?
      end
    elsif user.shop_owner?
      can :read, :all
      can :manage, Category do |category|
        !category.shop_id.blank? && category.shop.user == user
      end
      can :create, Category
      can :manage, Shop do |shop|
        shop.user == user
      end
      can :create, Shop
    elsif user.staff?
      can :read, :all
      can :manage, Product
    else
      can :read, :all
      can :manage, Shop do |shop|
        shop.user == user
      end
      can :create, Suggestion
      can :destroy, Suggestion do |suggestion|
        suggestion.status == Settings.status.processing 
      end
      can :edit, User do |user_account|
        user_account == user
      end
    end
  end
end
