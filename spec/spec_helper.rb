$LOAD_PATH.unshift(File.expand_path('../lib', __dir__))

require 'simplecov'

# SimpleCov.minimum_coverage 95
SimpleCov.start

# This module is only used to check the environment is currently a testing env
module SpecHelper
end

require 'fastlane' # to import the Action super class
require 'fastlane/plugin/flutter_versioncode_bump' # import the actual plugin

Fastlane.load_actions # load other actions (in case your plugin calls other actions or shared values)

def pubspec_sources_folder
  "/tmp/fastlane/tests/fastlane-plugin-flutter_versioncode_bump/pubspec-sources/"
end

def copy_prepared_pubspecs
  # create test folder
  source = "./spec/pubspec-sources"
  destination = "/tmp/fastlane/tests/fastlane-plugin-flutter_versioncode_bump/"

  FileUtils.mkdir_p(destination)

  # copy source to destination
  FileUtils.cp_r(source, destination)
end

def clean_prepared_pubspecs
  FileUtils.rm_r("/tmp/fastlane/tests/fastlane-plugin-flutter_versioncode_bump/")
end
