Pod::Spec.new do |s|
  s.name             = "ADAutoLayout"
  s.version          = "0.1.1"
  s.summary          = "A category on UIView to simplify programmatically use of Auto Layout."
  s.description      = "Auto Layout constraints constants as properties. More options will be added soon."
  s.license          = 'MIT'
  s.author           = { "axldyb" => "aksel.dybdal@shortcut.no" }
  s.source           = { :git => "https://github.com/axldyb/ADAutoLayout.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/axldyb'
  s.homepage         = 'http://www.akseldybdal.com'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'ADAutoLayout'
  s.public_header_files = 'ADAutoLayout/*.h'
end
