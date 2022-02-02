# flutter_versioncode_bump plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-flutter_versioncode_bump) [![Gem Version](https://badge.fury.io/rb/fastlane-plugin-flutter_versioncode_bump.svg)](https://badge.fury.io/rb/fastlane-plugin-flutter_versioncode_bump)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-flutter_versioncode_bump`, add it to your project by running:

```bash
fastlane add_plugin flutter_versioncode_bump
```

## About flutter_versioncode_bump

Bump the flutter version code. This plugin requires that the `version:` option is used of the Flutter project its pubspec.yaml. It bumps the versioncode with +1 or the given increment. Supported versioncode examples are: `+0`, `+0001`, `+2022010001` etc. Checkout the [Flutter documentation](https://docs.flutter.dev/development/tools/pubspec) for more information about the pubspec or versioncode.

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`. There is a [example `pubspec.yaml`](pubspec.yaml) available to bump the version code of.

Add `flutter_versioncode_bump` to your Fastfile to use it with the default options. [example `Fastfile`](fastlane/Fastfile)

or override the options in the Fastfile. Example:
```
flutter_versioncode_bump({
    pubspec_location: "./pubspec.yaml", # Changes the location of the pubspec.yaml
    version_code_increment: 1           # Changes the increment of the bump
})
```

Environment variables can also be used. Example:
```
PUBSPEC_LOCATION        # Changes the location of the pubspec.
VERSION_CODE_INCREMENT  # Changes the increment of the bump
```

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
