require 'thor'
require_relative '../mobproject/generators/project'

module MobProject
  class CLI < Thor

    desc "create <project_name>", "Create a new test project"
    def create(project_name)
      puts "...Creating project structure for #{project_name}"
      MobProject::Generators::Project.start([project_name])
    end

  end
end