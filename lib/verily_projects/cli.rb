require 'pry'

module VerilyProjects
  class CLI
    def call
      #VerilyProjects::Scraper.new.projects
      puts "\nWelcome to the verily projects CLI! \n"
      puts "\nPlease select the number for the project you would like more information about.\n"
      puts " "
      get_projects
      list_projects

      get_user_project
      puts "Would you like more information about another project? Please enter y/n."
      get_user_response
      #logic to determine whether to loop through beginning of CLI for new project.
      # else, continue
      puts "Have a great day!"
    end

    def get_projects
      @projects = VerilyProjects::Scraper.new.scrape_projects
    end

    def list_projects
      @projects.each.with_index(1) do |project, index|
      puts "#{index}. #{project}"
      end
    end

    def get_user_project
      @chosen_project = gets.strip.to_i
      if valid_input?(@chosen_project, @projects)
    end

    end

    def valid_input?(input, data)
      #check to make sure @chosen_project is within the range given
      if input <= data.length && input > 0
      end
    end

    def get_project_details
      #get project info using scraper class
    end

    def get_user_response
      @user_response = gets.strip
    end
  end
end
