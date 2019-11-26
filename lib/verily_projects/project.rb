require_relative './cli.rb'

class VerilyProjects::Project
    attr_accessor :name, :info
  @@all = []

  def initialize(name)
    @name = name
    @info = ""
    save
  end

  def self.all
    VerilyProjects::Scraper.scrape_projects if @@all.empty?
    @@all
  end

  def info
    info = VerilyProjects::Scraper.scrape_info(self) if @info.empty?
    puts @info
  end

  def save
    @@all << self
  end

end
