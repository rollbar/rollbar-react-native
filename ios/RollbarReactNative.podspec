Pod::Spec.new do |s|
  s.name         = "RollbarReactNative"
  s.version      = "0.1.0"
  s.summary      = "RollbarReactNative"
  s.description  = <<-DESC
                  RollbarReactNative
                   DESC
  s.license      = "MIT"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RollbarReactNative.git", :tag => "master" }
  s.source_files  = "RollbarReactNative/**/*.{h,m}"
  s.requires_arc = true

  s.dependency "React"
  s.frameworks = "SystemConfiguration",
                 "UIKit",
                 "Foundation"

  s.vendored_frameworks = "Frameworks/CrashReporter.framework",
                          "Frameworks/Rollbar.framework"

end
