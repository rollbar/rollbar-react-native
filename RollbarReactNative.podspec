Pod::Spec.new do |s|
  s.name         = 'RollbarReactNative'
  s.version      = '0.5.0'
  s.summary      = 'RollbarReactNative'
  s.description  = <<-DESC
                  RollbarReactNative is a library for interacting with the Rollbar
                  error monitoring system in React Native apps.
                   DESC
  s.homepage     = 'https://rollbar.com'
  s.license      = 'MIT'
  s.author       = { 'Rollbar' => 'support@rollbar.com' }
  s.platform     = :ios, '7.0'
  s.source       = { :git => 'https://github.com/author/RollbarReactNative.git', :tag => 'v0.5.0' }
  s.requires_arc = true

  s.dependency 'React'
  s.dependency 'Rollbar', '~> 1.5.0'

  s.source_files  = 'ios/RollbarReactNative.{h,m}'
  s.public_header_files = 'ios/RollbarReactNative.h'
end
