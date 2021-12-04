# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Category, user: user
    can :manage, Treaty, user: user
  end
end
