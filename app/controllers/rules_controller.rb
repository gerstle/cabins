class RulesController < ApplicationController
  def index
    @rules = Post.where("category = 'rule'")
  end
end
