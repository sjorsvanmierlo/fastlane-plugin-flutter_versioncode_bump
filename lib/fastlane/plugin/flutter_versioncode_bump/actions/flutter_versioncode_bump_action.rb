require 'fastlane/action'
require 'yaml'
require_relative '../helper/flutter_versioncode_bump_helper'

module Fastlane
  module Actions
    class FlutterVersioncodeBumpAction < Action
      def self.run(params)
        # Retrieve given params
        pubspec_location = params[:pubspec_location]
        version_code_increment = params[:version_code_increment]

        UI.message("Let's bump the flutter version code with an increment of #{version_code_increment}!")

        # Retrieve the full version of the given pubspec.yaml location
        full_version = Helper::FlutterVersioncodeBumpHelper.retrieve_full_version(pubspec_location)
        UI.message('Current version is:'.dup.concat(full_version))

        # Bump the version code of the full version by the increment that is given
        full_version = Helper::FlutterVersioncodeBumpHelper.bump_version_code(full_version, version_code_increment)
        
        # Update the version code of the pubspec.yaml
        Helper::FlutterVersioncodeBumpHelper.write_full_version(pubspec_location, full_version)
        UI.success('Succesfully bumped flutter version to: ' + full_version.to_s)
        {
          'version' => full_version
        }
      end

      def self.description
        "A plugin to bump the flutter version code with fastlane."
      end

      def self.authors
        ["Sjors van Mierlo"]
      end

      def self.return_value
        [
          ['VERSION', 'The bumped version']
        ]
      end

      def self.details
        "A plugin to bump the flutter version code with fastlane
        and also keep the comments in the pubspec.yaml.

        Useful for automated app distribution with an unique version code for each build."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :pubspec_location,
                                  env_name: "PUBSPEC_LOCATION",
                               description: "The location of the pubspec.yaml",
                                  optional: true,
                                      type: String,
                                      default_value: 'pubspec.yaml'),
          FastlaneCore::ConfigItem.new(key: :version_code_increment,
                                  env_name: "VERSION_CODE_INCREMENT",
                               description: "The increment of the version code",
                                  optional: true,
                                      type: Integer,
                             default_value: 1)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
