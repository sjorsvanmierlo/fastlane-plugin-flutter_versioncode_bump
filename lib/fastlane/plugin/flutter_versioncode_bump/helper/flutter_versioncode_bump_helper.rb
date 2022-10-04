require 'fastlane_core/ui/ui'
require 'yaml'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?(:UI)

  module Helper
    class FlutterVersioncodeBumpHelper
      def self.retrieve_full_version(pubspec_location)
        begin
          pubspec = YAML.load_file(pubspec_location)
        rescue StandardError
          raise 'Reading the pubspec failed!'
        end

        pubspec['version']
      end

      def self.write_full_version(pubspec_location, version)
        # To retain the comments and whitespace(s) in the file replace the version in the text.
        pubspec_as_text = File.read(pubspec_location)

        # Apply regex to edit the version line
        pubspec_new_content = pubspec_as_text.sub(/version:.*/, "version: #{version}")

        # Write updated content to pubspec
        File.open(pubspec_location, 'w') { |file| file.puts(pubspec_new_content) }
      rescue StandardError
        raise "Could not write the updated version to the pubspec"
      end

      def self.bump_version_code(full_version, increment)
        unless full_version.include?('+')
          raise 'No version code to bump :( ! Add a version code (example: 1.0.0+0001)'
        end

        splitted_version = full_version.split('+')

        version_name = splitted_version[0]
        version_code = splitted_version[1]

        # TODO: Add check for negative value!

        if version_code.to_i < 0 || version_code.to_s.length == 0
          raise 'Version code is invalid! Should be 0 or greater.'
        end

        incremented_version_code = version_code.to_i + increment
        new_version_code = format("%0#{version_code.to_s.length}d", incremented_version_code.to_s)

        "#{version_name}+#{new_version_code}"
      end
    end
  end
end
