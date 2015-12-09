Gem::Specification.new do |s|
  s.name        = 'mobproject'
  s.version     = '0.0.1'
  s.date        = '2015-12-08'
  s.summary     = 'Creates a project directory to test mobile and web applications with Appium/Selenium and Cucumber'
  s.description = 'Creates a project directory test iOS, Android mobile and Web applications with Appium/Selenium and Cucumber'
  s.authors     = ['Milton Davalos']
  s.email       = 'miltondavalos@gmail.com'
  s.homepage    = 'https://github.com/miltondavalos/MobProject'
  s.license       = 'MIT'
  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency 'require_all'
  s.add_dependency 'thor'
end