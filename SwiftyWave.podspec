
Pod::Spec.new do |s|
  s.name         = "SwiftyWave"
  s.version      = "1.1.0"
  s.summary      = "Sound Waves View in Swift."
  s.description  = <<-DESC
                   Sound Waves View in Swift, Support Storyboard
                   DESC

  s.homepage     = "https://github.com/octree/SwiftyWave"

  s.license      = "SwiftyWave is released under the WTFPL license. (Do What the Fuck You Want to Public License)"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "Octree" => "octree@octree.me" }
  # s.social_media_url   = "http://twitter.com/"
  # s.platform     = :ios
  s.platform     = :ios, "9.0"
  s.swift_version = '4.2'
  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/octree/SwiftyWave.git", :tag => "#{s.version}" }

  s.source_files  = "Classes", "SwiftyWave/**/*.swift"
  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "SwiftyWave/**/**/*.h"
  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"
  # s.framework  = "SomeFramework"
  s.frameworks = "UIKit", "QuartzCore", "CoreGraphics"
end
