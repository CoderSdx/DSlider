#
# Be sure to run `pod lib lint DSlider.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DSlider'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DSlider.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        一个简单的进度条，一个可以有刻度的进度条，嗯。。。
                       DESC

  s.homepage         = 'https://github.com/CoderSdx/DSlider'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CoderSdx' => 'sundexiong@hotmail.com' }
  s.source           = { :git => 'https://github.com/CoderSdx/DSlider.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  
  s.platform     = :ios, "11.0"

  s.source_files = 'DSlider/Classes/**/*'
  
  s.swift_versions = ['5.0']
  
end
