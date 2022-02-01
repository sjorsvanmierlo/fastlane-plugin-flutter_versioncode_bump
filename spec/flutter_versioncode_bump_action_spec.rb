describe Fastlane::Actions::FlutterVersioncodeBumpAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The flutter_versioncode_bump plugin is working!")

      Fastlane::Actions::FlutterVersioncodeBumpAction.run(nil)
    end
  end
end
