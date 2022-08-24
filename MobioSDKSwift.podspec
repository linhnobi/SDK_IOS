
Pod::Spec.new do |spec|


  spec.name         = "MobioSDKSwift"
  spec.version      = "0.0.1"
  spec.summary      = "This is my CocoaPod of MobioSDKSwift."

  spec.description  = <<-DESC
                        This Cocoa pod help you tracking your app
                   DESC

  spec.homepage     = "https://gitbucket.mobio.vn/git/SDK_APP/ios_swift_lib"


  spec.license      = "MIT"


  spec.author             = { "cuongvx" => "cuongvx@mobio.io" }

  spec.ios.deployment_target = "12.0"

  spec.swift_version = "5.0"


  spec.source       = { :git => "https://gitbucket.mobio.vn/git/SDK_APP/ios_swift_lib.git", :tag => "#{spec.version}" }


  spec.source_files = "Source/**/**/*.{swift,xib,xcdatamodeld}"
  spec.resources = ['*.{xib}']
  spec.resources = 'Source/CoreData/DataBase/*.xcdatamodeld'

  spec.pod_target_xcconfig = { 'PRODUCT_BUNDLE_IDENTIFIER': 'IOS.MobioSDKSwift' }

end
