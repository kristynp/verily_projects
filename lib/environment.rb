require_relative './verily_projects/version'
require_relative './verily_projects/cli'
require_relative './verily_projects/project.rb'
require_relative './verily_projects/scraper.rb'
require_relative './verily_projects/info.rb'

require 'pry'

module VerilyProjects
  class Error < StandardError; end
  # Your code goes here...
end
