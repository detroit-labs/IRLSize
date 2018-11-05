Pod::Spec.new do |s|
  s.name             = "IRLSize"
  s.version          = "1.3.0"
  s.summary          = "A library for determining the actual physical size of pixels on an iOS or watchOS device."
  s.description      = <<-DESC
                       IRLSize is used to determine the physical size of the device
                       you’re using, both width and height. It includes convenience
                       methods for drawing a view at a specific size as well as
                       determining the physical size of a view.
                       DESC
  s.homepage         = "http://www.detroitlabs.com"
  s.license          = 'MIT'
  s.author           = { "Jeff Kelley" => "SlaunchaMan@gmail.com" }
  s.source           = { :git => "https://github.com/detroit-labs/IRLSize.git",
                         :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.watchos.deployment_target = '3.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/*', 'Pod/Classes/Private/*'
  s.private_header_files = 'Pod/Classes/Private/*.h'
  s.frameworks = 'Foundation'

  s.ios.source_files = 'Pod/Classes/iOS/*'
  s.ios.frameworks = 'UIKit'

  s.watchos.source_files = 'Pod/Classes/watchOS/*'
  s.watchos.frameworks = 'WatchKit'

  s.dependency 'SDVersion', '~> 4.3.0'
end
