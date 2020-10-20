# Policies for authorizing users to see or create news
class NewPolicy < ApplicationPolicy
  # Only allow logged in users to see a specific new
  def show?
    user.logged_in == true
  end

  # Only allow admin users to create anew
  def create?
    user.admin == true
  end

  # Authorizing scope to filter who can see which news
  class Scope < Scope
    def resolve
      # Only allow logged in users to see all news (for index)
      scope.all if user.logged_in
    end
  end
end
