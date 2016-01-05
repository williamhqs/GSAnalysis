#
# Be sure to run `pod lib lint GSAnalysis.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "GSAnalysis"
  s.version          = "0.5.1"
  s.summary          = "An easy to use libray to draw analysis graphics in swift."

  s.description      = <<-DESC
  GSAnalysis is a light weight and easy to use libray to draw analysis graphics in swift. It provides many kinds of graphics which only need you provide the data.
                       DESC

  s.homepage         = "https://github.com/williamhqs/GSAnalysis"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "William Hu" => "william.hqs@gmail.com" }
  s.source           = { :git => "https://github.com/williamhqs/GSAnalysis.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/GoalStack'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'GSAnalysis' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  #, 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
