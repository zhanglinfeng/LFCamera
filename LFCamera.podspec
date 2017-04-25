Pod::Spec.new do |s|
s.name = 'LFCamera'
s.version = '1.0'
s.license = { :type => "MIT", :file => "LICENSE" }
s.summary = '可自定义相机UI，可选带拍摄区域边框及半透明遮罩层 '
s.homepage = 'https://github.com/zhanglinfeng/LFCamera'
s.authors = { '张林峰' => '1051034428@qq.com' }
s.source = { :git => 'https://github.com/zhanglinfeng/LFCamera.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = 'LFCamera/LFCamera/*.{h,m}'
end
