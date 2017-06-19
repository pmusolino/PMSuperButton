Pod::Spec.new do |s|
  s.name         = "PMSuperButton"
  s.version      = "1.0"
  s.summary      = "PMSuperButton is a standard UIButton with super powers!"
  s.description  = <<-DESC
    PMSuperButton is a standard UIButton coming from the countryside, but with super powers!
  DESC
  s.homepage     = "https://github.com/Codeido/PMSuperButton"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Paolo Musolino" => "info@codeido.com" }
  s.social_media_url   = "https://github.com/Codeido/PMSuperButton"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => ".git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
