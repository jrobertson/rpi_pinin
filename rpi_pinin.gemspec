Gem::Specification.new do |s|
  s.name = 'rpi_pinin'
  s.version = '0.1.3'
  s.summary = 'Represents a Raspberry Pi GPIO pin in e.g. to read a button press.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/rpi_pinin.rb']
  s.signing_key = '../privatekeys/rpi_pinin.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/rpi_pinin'
end
