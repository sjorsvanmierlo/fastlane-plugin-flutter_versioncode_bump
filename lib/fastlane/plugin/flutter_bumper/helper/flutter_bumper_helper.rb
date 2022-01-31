require 'fastlane_core/ui/ui'
require 'yaml'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class FlutterBumperHelper
      # class methods that you define here become available in your action
      # as `Helper::FlutterBumperHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the flutter_bumper plugin helper!")
      end

      def self.retrieve_full_version(pubspec_location)
        begin
          pubspec = YAML.load_file(pubspec_location)
        rescue
          raise 'Reading the pubspec failed!'
        end

        full_version = pubspec['version']
      end


      def self.write_full_version(pubspec_location, version)
        begin
          #To retain the comments and whitespace(s) in the file replace the version in the text.
          pubspec_as_text = File.read(pubspec_location)

          #Apply regex to edit the version line
          pubspec_new_content = pubspec_as_text.gsub(/version:.*/, "version: #{version}");

          #Write updated content to pubspec
          File.open(pubspec_location,'w') {|file| file.puts pubspec_new_content}
        rescue
          raise "Could not write the updated version to the pubspec"
        end 
      end


      def self.bump_version_code(full_version, increment)
      
        if !full_version.include?('+')
          # UI.error("No version code to bump :( ! Add a version code (example: 1.0.0+0001)")
          raise 'No version code to bump :( ! Add a version code (example: 1.0.0+0001)'
        end

        splitted_version = full_version.split('+')

        version_name = splitted_version[0]

        # TODO: Add support for (0001) version codes
        version_code = splitted_version[1]

        # Increment the version code by the increment (default: +1);
        version_code = version_code.to_i + increment


        new_full_version = "#{version_name.to_s}+#{version_code.to_s}"
      end
    end
  end
end
