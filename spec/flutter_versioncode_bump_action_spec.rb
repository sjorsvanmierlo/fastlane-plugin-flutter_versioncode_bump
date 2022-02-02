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

    after do
      clean_prepared_pubspecs
    end
  end
end
