require 'open-uri'
require 'nokogiri'
require 'pry'
require 'csv'
require_relative './cli.rb'
require_relative './project.rb'

class VerilyProjects::Scraper
  attr_accessor :name

  def self.scrape_projects
    site = "https://verily.com/projects/"
    doc = Nokogiri::HTML(open(site)).css('h3').text.split(/[\n]/)
    @projects = []
    doc.each do |project|
      clean = project.gsub(/\s+/, "")
      @projects << clean unless clean == ""
    end
    @projects.each {|project| VerilyProjects::Project.new(project)}
  end

  VerilyProjects::Scraper.scrape_projects
  puts @projects
  #binding.pry
end
