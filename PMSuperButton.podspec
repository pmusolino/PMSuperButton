Pod::Spec.new do |s|
  s.name         = "PMSuperButton"
  s.version      = "1.0"
  s.summary      = ""
  s.description  = <<-DESC
    Your description here.
  DESC
  s.homepage     = ""
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Paolo Musolino" => "info@codeido.com" }
  s.social_media_url   = ""
  s.ios.deployment_target = "8.0"
  s.source       = { :git => ".git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
