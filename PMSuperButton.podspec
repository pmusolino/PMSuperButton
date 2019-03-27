Pod::Spec.new do |s|
  s.name         = "PMSuperButton"
  s.version      = "3.0.0"
  s.summary      = "PMSuperButton is a powerful UIButton coming from the countryside, but with super powers!"
  s.description  = <<-DESC
    A easy way to create custom and complex buttons with custom attributes, directly added to the iOS Interface Builder, very easy to integrate in every project!
  DESC
  s.homepage     = "https://github.com/pmusolino/PMSuperButton"
  s.screenshots  = "https://raw.githubusercontent.com/pmusolino/PMSuperButton/master/docs/interface_builder.png"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Paolo Musolino" => "info@codeido.com" }
  s.social_media_url   = "http://twitter.com/pmusolino"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/pmusolino/PMSuperButton.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
