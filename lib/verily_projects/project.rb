require_relative './cli.rb'

class VerilyProjects::Project
    attr_accessor :name, :project, :description, :how
  @@all = []

  def initialize(name)
    @name = name
    @description = ""
    @how = ""
    save
  end

  def self.all
    VerilyProjects::Scraper.scrape_projects if @@all.empty?
    @@all
  end

  def info
    # check if there is any info. If no info, scrape it.
    info = VerilyProjects::Scraper.scrape_info(self) if @description.empty?
    #self will be referring to chosen month for our purposes.
    binding.pry 
    # puts @description
    # puts @how
  end

  def save
    @@all << self
  end

end
