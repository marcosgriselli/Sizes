Pod::Spec.new do |s|
  s.name             = 'Sizes'
  s.version          = '0.5.1'
  s.summary          = 'View your app on different device and font sizes.'

  s.description      = <<-DESC
                        Sizes lets you view your app on different device and font sizes.
                       DESC

  s.homepage         = 'https://github.com/marcosgriselli/Sizes'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'Marcos Griselli'
  s.source           = { :git => 'https://github.com/marcosgriselli/Sizes.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/marcosgriselli'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Sizes/Classes/**/*.{h,m,swift}'
  s.resources = ['Sizes/Classes/ViewControllers/ConfigurationViewController.xib']
  s.swift_version = '5.2'
  s.swift_versions = ['4.2', '5.0', '5.1']
end
