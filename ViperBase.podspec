Pod::Spec.new do |s|
  s.name             = 'ViperBase'
  s.version          = '0.1.1'
  s.summary          = 'Base VIPER classes, samples and templates on Swift'
  s.description      = <<-DESC
                       ViperBase will show you how to use VIPER architecture in practice and will simplify your work using good code samples and useful XCode templates
                       DESC

  s.homepage         = 'https://github.com/zSOLz/viper-base'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Andrew Solovey' => 'sol.bsuir@gmail.com' }
  s.source           = { :git => 'https://github.com/zSOLz/viper-base.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'ViperBase/ViperBase/**/*.swift'
  s.requires_arc = true
  s.frameworks = 'UIKit'
end
