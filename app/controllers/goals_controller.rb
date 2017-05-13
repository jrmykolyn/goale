class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def show
    begin
      @goal = Goal.find( params[ :id ] )
    rescue
      @goal = nil
    end
  end
end
