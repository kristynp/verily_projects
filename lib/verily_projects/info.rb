# require_relative './cli.rb'
# require_relative './project.rb'
# require_relative './scraper.rb'
#
# class VerilyProjects::Info
#   attr_accessor :name, :project, :how, :description, :info
#   @@all = []
#
#   def initialize(project, description, how)
#     @project = project
#     @name = project.name
#     @description = description
#     @how = how
#     project.description = description
#     project.how = how
#     save
#   end
#
#   def info
#     binding.pry
#     puts @project
#     @project
#   end
#
#   def self.all
#     @@all
#   end
#
#   def save
#     @@all << self
#   end
#   #binding.pry
# end
