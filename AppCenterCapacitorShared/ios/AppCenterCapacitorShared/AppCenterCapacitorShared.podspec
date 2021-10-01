Pod::Spec.new do |s|
  s.name             = 'AppCenterCapacitorShared'
  s.version          = '0.3.3'
  s.summary          = 'Shared utility to assist with bootstrapping AppCenter for Capacitor plugin.'
  s.homepage         = 'https://github.com/capacitor-community/appcenter-sdk-capacitor'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'johnborges' => 'john.borges@icloud.com' }
  s.source           = { :git => 'https://github.com/capacitor-community/appcenter-sdk-capacitor.git' , :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/johnborges'
  s.ios.deployment_target = '12.0'
  s.swift_version = '5.1'
  # s.source_files = '*.swift'
  s.dependency 'AppCenter/Core', '4.3.0'
  s.static_framework = true
  # s.vendored_frameworks = '**/AppCenterCapacitorShared.xcframework'
end
