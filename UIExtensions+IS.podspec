#
# Be sure to run `pod lib lint UIExtensions-IS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    
  s.name             = 'UIExtensions+IS'
  s.version          = '1.0.1'
  s.summary          = 'UIExtensions to facilitate using UIKit'
  s.description      = 'Extensions for CGfloat, CGsize, CGpoint, Gestures, UIView, UIImaage, UIImageView, UIColor, UINavigation, UITableView, UIScreen, UITextFiled, ...'
  s.homepage         = 'https://github.com/islamshazly/UIExtensions-IS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'islamshazly' => 'ishazly92@gmail.com' }
  s.source           = { :git => 'https://github.com/islamshazly/UIExtensions-IS.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/elshazly92'
  s.ios.deployment_target = '10.0'
  s.source_files = 'UIExtensions-IS/Classes/**/*.{swift}'
  s.frameworks = 'UIKit'
  s.dependency 'Kingfisher', '~>4.10.1'
  s.dependency 'Reusable'
  
end
