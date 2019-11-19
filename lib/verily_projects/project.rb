require_relative './cli.rb'

class VerilyProjects::Project
  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    save
  end

  def self.all
    VerilyProjects::Scraper.scrape_projects if @@all.empty?
    @@all
  end

  def save
    @@all << self
  end

end
