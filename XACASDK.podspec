@version = "1.0.1"

Pod::Spec.new do |s|
  s.name         = "LCActionAlertView"
  s.version      = @version
  s.summary      = "河南中远手机软盾项目."
  s.description  = <<-DESC
                      pod search XACASDK 到项目 或者拖入XACASDK.framework到你的项目即可使用
                      *
                   DESC
  s.homepage     = "https://github.com/loversunny/LCActionAlertView"
  s.license      = "MIT"
  s.author             = { "冀柳冲" => "HH330897537@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/loversunny/XACASDK.git",:tag => "v#{s.version}" }
  s.source_files  = "XACASDK/*.{h}"
  s.framework  = "UIKit"
  s.requires_arc = true

end
