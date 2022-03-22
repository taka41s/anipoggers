class VideoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def create?
      @user.has_role? :admin
    end
  end
end
