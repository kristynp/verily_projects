require 'open-uri'
require 'nokogiri'
require 'pry'
require 'csv'
require_relative './cli.rb'
require_relative './project.rb'

class VerilyProjects::Scraper
  attr_accessor :name, :projects, :info

  def self.scrape_projects
    site = "https://verily.com/projects/"
    doc = Nokogiri::HTML(open(site)).css('h3').text.split(/[\n]/)
    @projects = []
    doc.each do |project|
      clean = project.gsub(/\s\s+/, "")
      @projects << VerilyProjects::Project.new(clean) unless clean == ""
    end
  end

  def self.scrape_info(project, index)
    site = "https://verily.com/projects/"
    base_site = "verily.com"
    link_array = Nokogiri::HTML(open(site)).css('a.flex-item').collect {|link| link.attribute('href')}

    second_level_site = "https://verily.com" << link_array[index]
    doc = Nokogiri::HTML(open(second_level_site)).css('p').text
    doc = doc.gsub(/\n\s\s+/, " ")
    project.info = doc
  end


end
