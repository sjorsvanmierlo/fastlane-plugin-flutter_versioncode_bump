require 'spec_helper'

describe Fastlane::Actions::FlutterVersioncodeBumpAction do
  describe '#run' do
    before do
      copy_prepared_pubspecs
    end

    it 'Bump versioncode 0.0.0+0 to 0.0.0+1' do
      params = { pubspec_location: "#{pubspec_sources_folder}test-pubspec-1.yaml", version_code_increment: 1 }

      result = Fastlane::Actions::FlutterVersioncodeBumpAction.run(params)
      expect(result).to eq({ "version" => "0.0.0+1" })
    end

    it 'Bump versioncode 0.0.0+9 to 0.0.0+10' do
      params = { pubspec_location: "#{pubspec_sources_folder}test-pubspec-2.yaml", version_code_increment: 1 }

      result = Fastlane::Actions::FlutterVersioncodeBumpAction.run(params)
      expect(result).to eq({ "version" => "0.0.0+10" })
    end

    it 'Bump versioncode 0.0.0+0000001 to 0.0.0+0000002' do
      params = { pubspec_location: "#{pubspec_sources_folder}test-pubspec-3.yaml", version_code_increment: 1 }

      result = Fastlane::Actions::FlutterVersioncodeBumpAction.run(params)
      expect(result).to eq({ "version" => "0.0.0+0000002" })
    end

    it 'Bump versioncode 0.0.0+123456000 to 0.0.0+123456001' do
      params = { pubspec_location: "#{pubspec_sources_folder}test-pubspec-4.yaml", version_code_increment: 1 }

      result = Fastlane::Actions::FlutterVersioncodeBumpAction.run(params)
      expect(result).to eq({ "version" => "0.0.0+123456001" })
    end

    it 'Bump versioncode 0.0.0+-1 to raise RuntimeException' do
      params = { pubspec_location: "#{pubspec_sources_folder}test-pubspec-5.yaml", version_code_increment: 1 }
      expect { Fastlane::Actions::FlutterVersioncodeBumpAction.run(params) }.to raise_error(RuntimeError)
    end

    it 'Bump versioncode 0.0.0+ to raise RuntimeException' do
      params = { pubspec_location: "#{pubspec_sources_folder}test-pubspec-6.yaml", version_code_increment: 1 }
      expect { Fastlane::Actions::FlutterVersioncodeBumpAction.run(params) }.to raise_error(RuntimeError)
    end

    it 'Bump versioncode 0.0.0+0 to 0.0.0+1 and do not bump the dependency called version' do
      # Arrange
      expected_pubspec_as_text = "version: 0.0.0+1\ndependencies:\n  version: ^3.0.2\n"
      pubspec_location = "#{pubspec_sources_folder}test-pubspec-7.yaml"
      params = { pubspec_location: pubspec_location, version_code_increment: 1 }
      # Act
      Fastlane::Actions::FlutterVersioncodeBumpAction.run(params)
      actual_pubspec_as_text = File.read(pubspec_location)
      # Assert
      expect(expected_pubspec_as_text).to eq(actual_pubspec_as_text)
    end

    after do
      clean_prepared_pubspecs
    end
  end
end
