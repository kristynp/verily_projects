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
      @projects = VerilyProjects::Project.all

    end

    def list_projects
      @projects.each.with_index(1) do |project, index|
      puts "#{index}. #{project.name}"
      end
    end

    def get_user_project
      @chosen_project = gets.strip.to_i
      show_info_for(chosen_project) if valid_input?(@chosen_project, @projects)
    end

    def valid_input?(input, data)
      #check to make sure @chosen_project is within the range given
      if input.to_i <= data.length && input.to_i > 0
      end
    end

    def show_info_for(chosen_project)
      project = @projects[@chosen_project - 1]
      puts "Here's more info about #{project}"
    end

    def get_user_response
      @user_response = gets.strip
    end
  end
end
