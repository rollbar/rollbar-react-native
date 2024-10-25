Pod::Spec.new do |s|
  s.name         = 'RollbarReactNative'
  s.version      = '1.0.0-beta.5'
  s.summary      = 'RollbarReactNative'
  s.description  = <<-DESC
                  RollbarReactNative is a library for interacting with the Rollbar
                  error monitoring system in React Native apps.
                   DESC
  s.homepage     = 'https://rollbar.com'
  s.license      = 'MIT'
  s.author       = { 'Rollbar' => 'support@rollbar.com' }
  s.platform     = :ios, '13.0'
  s.source       = { :git => 'https://github.com/rollbar/rollbar-react-native.git', :tag => '1.0.0-beta.5' }
  s.requires_arc = true

  s.dependency 'React-Core'
  s.dependency 'RollbarNotifier', '3.3.3'
  s.source_files  = 'ios/RollbarReactNative.{h,m}'
  s.public_header_files = 'ios/RollbarReactNative.h'

  s.compiler_flags = '-fmodules', '-fcxx-modules'
end
