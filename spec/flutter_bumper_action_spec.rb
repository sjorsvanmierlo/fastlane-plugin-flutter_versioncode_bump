describe Fastlane::Actions::FlutterBumperAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The flutter_bumper plugin is working!")

      Fastlane::Actions::FlutterBumperAction.run(nil)
    end
  end
end
