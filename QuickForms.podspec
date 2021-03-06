Pod::Spec.new do |s|
  s.name           = 'QuickForms'
  s.version        = '0.4'
  s.summary        = "Quick forms"
  s.homepage       = "https://github.com/Khmelevsky/QuickForms"
  s.author         = { 'Alexandr Khmelevsky' => 'khmelevsky.alex@gmail.com' }
  s.social_media_url   = "https://twitter.com/AlexKhmelevsky"
  s.source         = { :git => 'https://github.com/Khmelevsky/QuickForms.git', :tag => s.version }
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  s.requires_arc   = true
  s.source_files   = 'Sources/**/*.swift'
  s.license        = 'MIT'
end
