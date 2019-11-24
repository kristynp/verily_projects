require_relative './cli.rb'

class VerilyProjects::Project
    attr_accessor :name, :project, :info
  @@all = []
  
  def initialize(name)
    @name = name
    @info = []
    save
  end

  def self.all
    VerilyProjects::Scraper.scrape_projects if @@all.empty?
    @@all
  end

  def info
    # binding.pry
    # check if there is any info. If no info, scrape it.
    VerilyProjects::Scraper.scrape_info(self) if @info.empty?
    #self will be referring to chosen month for our purposes.
    @info
  end

  def save
    @@all << self
  end

end
