class VerilyProjects::CLI
  def call

    puts 'Welcome to the verily projects CLI! Which project would you like more information on today?'
    get_projects
    get_user_selection
    get_user_project
    puts 'Would you like more information about another project? Please enter y/n.'
    get_user_response
    #logic to determine whether to loop through beginning of CLI for new project.
    # else, continue
    puts "Have a great day!"
  end

  def get_projects
      @projects = ['fake', 'data', 'to', 'get', 'started']
  end

  def get_user_selection
    @user_project = gets.strip
  end

  def get_user_project
    #get project info using scraper class
  end

  def get_user_response
    @user_response = gets.strip
  end

end
