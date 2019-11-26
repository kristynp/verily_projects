require 'pry'

module VerilyProjects
  class CLI
    @continue_response = "nil"

    def call
      puts "\nWelcome to the verily projects CLI! \n"
      while @continue_response != "no" && @continue_response != "n"
        get_projects
        list_projects
        get_user_project
        puts "\nWould you like more information about another project? Please enter y/n."
        get_continue_response
      end

      puts "\nHave a great day!"
    end

    def get_projects
      @projects = VerilyProjects::Project.all
    end

    def list_projects
      puts "\nPlease select the number for the project you would like more information about.\n"
      puts " "
      @projects.each.with_index(1) do |project, index|
      puts "#{index}. #{project.name}"
      end
    end

    def get_user_project
      @chosen_project = gets.strip.to_i
      show_info_for(@chosen_project) if valid_input?(@chosen_project, @projects)
    end

    def valid_input?(input, data)
      if input.to_i <= data.length && input.to_i > 0
        true
      end
    end

    def show_info_for(chosen_project)
      index = @chosen_project - 1
      project = @projects[index]
      VerilyProjects::Scraper.scrape_info(project, index)
      puts "\nHere's more info about #{project.name}"
      puts "\n #{project.info}"
    end

    def get_continue_response
       @continue_response = gets.strip
    end
  end
end
