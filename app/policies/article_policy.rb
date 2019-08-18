# frozen_string_literal: true

class ArticlePolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    user.admin? || user.owner_of(record)
  end

  def destroy?
    user.admin? || user.owner_of(record)
  end
end
