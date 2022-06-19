Pod::Spec.new do |s|
  s.name             = 'AppCenterCapacitorShared'
  s.version          = '3.0.0'
  s.summary          = 'Shared utility to assist with bootstrapping AppCenter for Capacitor plugin.'
  s.homepage         = 'https://github.com/capacitor-community/appcenter-sdk-capacitor'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'johnborges' => 'john.borges@icloud.com' }
  s.source           = { :git => 'https://github.com/capacitor-community/appcenter-sdk-capacitor.git' , :tag => "AppCenter-SDK-Capacitor-iOS-Pod-#{s.version}" }
  s.social_media_url = 'https://twitter.com/johnborges'
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.1'
  s.source_files = 'AppCenterCapacitorShared/ios/AppCenterCapacitorShared/*.swift'
  s.dependency 'AppCenter/Core', '~> 4.4.0'
  s.static_framework = true
end