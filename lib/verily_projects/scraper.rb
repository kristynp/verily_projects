require 'open-uri'
require 'nokogiri'
require 'pry'
require 'csv'
require_relative './cli.rb'


class VerilyProjects::Scraper
    def scrape_projects
      site = "https://verily.com/projects/"
      doc = Nokogiri::HTML(open(site)).css('h3').text.split(/[\n]/)
      @projects = []
      doc.each do |project|
         clean = project.gsub(/\s+/, "")
         @projects << clean unless clean == ""
       end
       @projects
    end
  VerilyProjects::Scraper.new.scrape_projects
end
