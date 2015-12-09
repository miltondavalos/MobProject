require 'thor/group'

module MobProject
  module Generators
    class Project < Thor::Group
      include Thor::Actions

      argument :name, :type => :string, :desc => 'The name of the project'
      desc "Generates a project structure for testing with MobTest"

      def self.source_root
        File.dirname(__FILE__) + "/project"
      end

      def create_top_directory
        empty_directory(name)
      end

      def copy_gitignore
        template "gitignore.tt", "#{name}/.gitignore"
      end

      def copy_cucumber_yml
        template "cucumber.yml.tt", "#{name}/cucumber.yml"
      end

      def copy_gemfile
        template "Gemfile.tt", "#{name}/Gemfile"
      end

      def copy_rakefile
        copy_file "Rakefile.tt", "#{name}/Rakefile"
      end

      def copy_hack
        copy_file 'hack.rb.tt', "#{name}/hack.rb"
      end

      def create_cucumber_directories
        empty_directory("#{name}/features")
        empty_directory("#{name}/features/support")
        empty_directory("#{name}/features/support/mobile")
        empty_directory("#{name}/features/support/pages")
        empty_directory("#{name}/features/support/pages/common")
        empty_directory("#{name}/features/step_definitions")
        empty_directory("#{name}/features/support/mobile/platform")
        empty_directory("#{name}/features/support/mobile/platform/android")
        empty_directory("#{name}/features/support/mobile/platform/android/inventory")
        empty_directory("#{name}/features/support/mobile/platform/ios")
        empty_directory("#{name}/features/support/mobile/platform/ios/inventory")
        empty_directory("#{name}/features/support/settings")
      end

      def copy_env
        template "env.rb.tt", "#{name}/features/support/env.rb"
      end

      def copy_base
        template "base.rb.tt", "#{name}/features/support/base.rb"
      end

      def copy_hooks
        template "hooks.rb.tt", "#{name}/features/support/hooks.rb"
      end

      def copy_settings
        template "android.yml.tt", "#{name}/features/support/settings/android.yml"
        template "ios.yml.tt", "#{name}/features/support/settings/ios.yml"
      end

      def copy_utilities
        template "utilities.rb.tt", "#{name}/features/support/utilities.rb"
      end

      def copy_step_definitions
        template "step_definitions.rb.tt", "#{name}/features/step_definitions/step_definitions.rb"
      end

      def copy_mobtest_feature
        template "mobtest.feature.tt", "#{name}/features/mobtest.feature"
      end

      def copy_platforms
        template "platforms.rb.tt", "#{name}/features/support/mobile/platform/platforms.rb"
      end

      def copy_capabilities
        template "capabilities.rb.tt", "#{name}/features/support/mobile/platform/capabilities.rb"
      end

      def copy_inventory
        template 'android_devices.yml.tt', "#{name}/features/support/mobile/platform/android/inventory/devices.yml"
        template 'android_emulators.yml.tt', "#{name}/features/support/mobile/platform/android/inventory/emulators.yml"
        template 'android_sauce.yml.tt', "#{name}/features/support/mobile/platform/android/inventory/sauce.yml"
        template 'ios_devices.yml.tt', "#{name}/features/support/mobile/platform/ios/inventory/devices.yml"
        template 'ios_simulators.yml.tt', "#{name}/features/support/mobile/platform/ios/inventory/simulators.yml"
        template 'ios_sauce.yml.tt', "#{name}/features/support/mobile/platform/ios/inventory/sauce.yml"
      end

      def copy_login
        template "login.rb.tt", "#{name}/features/support/pages/login.rb"
      end

    end
  end
end