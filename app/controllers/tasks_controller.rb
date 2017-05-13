class TasksController < ApplicationController
  def new
    @goal = Goal.find( params[ :goal_id ] )
    @task = Task.new
  end

  def create
    @goal = Goal.find( params[ :goal_id ] )
    @task = Task.new( task_params( params ) )

    @goal.tasks << @task

    if @task.save
      redirect_to( goal_path( @goal ) )
    else
      render :new
    end
  end

  private
  def task_params( params )
    return params.require( :task ).permit( :name, :description )
  end
end
