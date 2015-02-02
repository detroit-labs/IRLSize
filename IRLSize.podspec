Pod::Spec.new do |s|
  s.name             = "IRLSize"
  s.version          = "0.1.4"
  s.summary          = "A library for determining the actual physical size of pixels on an iOS device."
  s.description      = <<-DESC
                       IRLSize is used to determine the physical size of the iOS
                       device you’re using, both width and height. It includes
                       convenience methods for drawing a view at a specific size
                       as well as determining the physical size of a view.
                       DESC
  s.homepage         = "http://www.detroitlabs.com"
  s.license          = 'MIT'
  s.author           = { "Jeff Kelley" => "SlaunchaMan@gmail.com" }
  s.source           = { :git => "https://github.com/detroit-labs/IRLSize.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.public_header_files = 'Pod/Classes/**/*.h'

  s.frameworks = 'Foundation', 'UIKit'
  s.dependency 'SDiPhoneVersion', '~> 1.1.1'
end
