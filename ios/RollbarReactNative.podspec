Pod::Spec.new do |s|
  s.name         = "RollbarReactNative"
  s.version      = "1.0.0"
  s.summary      = "RollbarReactNative"
  s.description  = <<-DESC
                  RollbarReactNative
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RollbarReactNative.git", :tag => "master" }
  s.source_files  = "RollbarReactNative/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"

end
