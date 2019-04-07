platform :ios, '12.0'

def shared_pods
	pod 'Alamofire', '~> 4.7'
end

target 'EventyayOrganizer' do
  use_frameworks!
  # Pods for EventyayOrganizer
  pod 'Motion', :git => 'https://github.com/CosmicMind/Motion.git', :branch => 'development'
  pod 'Material', :git => 'https://github.com/CosmicMind/Material.git', :branch => 'development'
  pod 'M13Checkbox', :git => 'https://github.com/Marxon13/M13Checkbox.git', :branch => 'swift_4_2'
  pod 'ObjectMapper', '~> 3.4'
  pod 'AlamofireObjectMapper', '~> 5.2'
  pod 'NVActivityIndicatorView'
  shared_pods
end

  target 'EventyayOrganizerUITests' do
    use_frameworks!
  
    shared_pods
end
