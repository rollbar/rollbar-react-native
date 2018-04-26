Pod::Spec.new do |s|
  s.name         = "RollbarReactNative"
  s.version      = "0.2.0-alpha4"
  s.summary      = "RollbarReactNative"
  s.description  = <<-DESC
                  RollbarReactNative is a library for interacting with the Rollbar
                  error monitoring system in React Native apps.
                   DESC
  s.homepage     = "https://rollbar.com"
  s.license      = "MIT"
  s.author       = { "Rollbar" => "support@rollbar.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RollbarReactNative.git", :tag => "v0.2.0-alpha4" }
  s.source_files  = "RollbarReactNative.{h,m}",
    "Frameworks/Rollbar.framework/Versions/A/Headers/*.h",
    "Frameworks/CrashReporter.framework/Versions/A/Headers/*.h"
  s.public_header_files = "RollbarReactNative.h",
    "Frameworks/Rollbar.framework/Versions/A/Headers/*.h",
    "Frameworks/CrashReporter.framework/Versions/A/Headers/*.h"
  s.requires_arc = true

  s.dependency "React"
  s.frameworks = "SystemConfiguration",
                 "UIKit",
                 "Foundation"

  s.vendored_frameworks = "Frameworks/CrashReporter.framework",
                          "Frameworks/Rollbar.framework"

end
