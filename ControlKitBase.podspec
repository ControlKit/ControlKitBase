Pod::Spec.new do |spec|
  spec.name         = 'ControlKitBase'
  spec.version      = '0.0.1'
  spec.summary      = 'A short description of ControlKitBase.'

  spec.license = 'MIT'
  spec.summary = 'The ControlKitBase in all app is handled easily.'
  spec.homepage = 'https://github.com/ControlKit/ControlKitBase'
  spec.source = { :git => 'https://github.com/ControlKit/ControlKitBase.git', :tag => "#{spec.version}" }
  spec.ios.deployment_target = '13.0'
  spec.source_files = 'Sources/*.swift', 'Sources/**/*.swift', 'Sources/**/**/*.swift'
  spec.resources = 'Sources/ControlKitBase/Resources/*.xcassets'
  spec.authors = { 'Maziar Saadatfar' => 'maziar.saadatfar@gmail.com' }
  spec.swift_versions = ['5.0']
end
