class GoalsController < ApplicationController
  def index
    if params[ :order_by ]
      order_by = params[ :order_by ]
      order = params[ :order ] == 'desc' ? 'desc' : 'asc'

      @goals = Goal.order( { order_by => order } )
    else
      @goals = Goal.all
    end
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
