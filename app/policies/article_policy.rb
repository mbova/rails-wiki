class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope
    def resolve
      scope.where(:author_id => user.id)
    end
  end
end