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

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new( goal_params( params ) )

    if @goal.save
        redirect_to @goal
    else
      render :new
    end
  end

  private
  def goal_params( params )
    return params.require( :goal ).permit( :name, :description )
  end
end
