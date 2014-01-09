require 'rubygems'
require 'resque/helpers'
require './computer_worker'
                  class Computer
			  def add(a, b)
		  Resque.enqueue(ComputerWorker, :+, a, b)
			  end
			  def multiply(a, b)
			  Resque.enqueue(ComputerWorker, :*, a, b)

			  end
		  end 
		  computer = Computer.new
		  computer.add(5, 10)
		  computer.multiply(10, 0.5)
