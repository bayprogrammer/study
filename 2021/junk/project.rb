#!/usr/bin/ruby

class Project
  attr_accessor :name, :tasks

  def initialize(name, tasks)
    @name = name
    @tasks = tasks
  end
end

p = Project.new('Frobnicator', ['install rails', 'learn ruby', '???', 'profit!'])

puts p.name
pp p.tasks

p.tasks.append('start making games!')
pp p.tasks
