

Pod::Spec.new do |s|


  s.name         = "DropDownMenu"
  s.version      = "0.0.1"
  s.summary      = "DropDownMenu"

  s.description  = <<-DESC
这是一个下拉菜单，可显示多列，支持CollectionView和TableView显示子类。
                   DESC

  s.homepage     = "https://github.com/TonnyTeng/DropDownMenu"


  s.license      = "MIT"


  s.author             = { "dengtao" => "1083683360@qq.com" }

  s.ios.deployment_target = '8.0'


  s.source       = { :git => "https://github.com/TonnyTeng/DropDownMenu.git", :tag => “0.0.1” }
  s.source_files  = "DTDropDownMenu/DropDownMenu/*.{h,m}”

  s.framework  = “UIKit”

  s.requires_arc = true


end
