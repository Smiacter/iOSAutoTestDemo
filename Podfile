platform :ios, '10.0'
use_frameworks!

def testing_pods
    pod 'Quick'
    pod 'Nimble'
end

target 'DemoTests' do
    testing_pods
    pod 'KIF', :configurations => ['Debug']
end

# Manually making Quick compiler version be swift 3.2
post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == 'Quick' || target.name == 'Nimble'
            print "Changing Quick swift version to 3.2\n"
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.2'
            end
        end
    end
end
