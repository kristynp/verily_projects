require 'open-uri'
require 'nokogiri'
require 'pry'
require 'csv'
require_relative './cli.rb'
require_relative './project.rb'
require_relative './info.rb'

class VerilyProjects::Scraper
  attr_accessor :name, :projects

  def self.scrape_projects
    site = "https://verily.com/projects/"
    doc = Nokogiri::HTML(open(site)).css('h3').text.split(/[\n]/)
    @projects = []
    doc.each do |project|
      clean = project.gsub(/\s+/, "")
      @projects << VerilyProjects::Project.new(clean) unless clean == ""
    end
  end

  def self.scrape_info(project)
    #binding.pry
    VerilyProjects::Info.new(project, "Such description", "How we do things!")
  end
  VerilyProjects::Scraper.scrape_projects
  #VerilyProjects::Scraper.scrape_info(@projects)

end
