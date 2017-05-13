# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |i|
    name = "Goal ##{i + 1}"
    description = "This is the description for Goal ##{i + 1}."

    goal = Goal.new( { :name => name, :description => description } )

    goal.save

    id = goal.id

    (1..5).to_a.sample.times do |j|
      t = Task.new

      t.name = "Task ##{i}.#{j}"
      t.goal_id = id

      t.save
    end
end
