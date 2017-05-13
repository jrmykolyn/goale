require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  # ENSURE THAT 'name' PROP EXISTS
  test "should not save Goal without name" do
      goal = Goal.new( { :description => "Test description" } )

      assert_not goal.save
  end
  
  test "should not save Goal without description" do
      goal = Goal.new( { :name => "Test Goal" } )
      
      assert_not goal.save
  end
  
  test "should save Goal when name and description are present" do
      goal = Goal.new( { :name => "Test Goal", :description => "Test description" } )
      
      assert goal.save
  end
end
