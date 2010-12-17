require 'formula'

class GeoipBeta <Formula
  url 'http://geolite.maxmind.com/download/geoip/api/c/test/GeoIP-1.4.7beta9.tar.gz'
  homepage 'http://geolite.maxmind.com/download/geoip/api/c/test/'
  md5 '5f23a007567c6c9fa2cc89d283077ead'

  def options
    [["--universal", "Build a universal binary."]]
  end

  def install
    ENV.universal_binary if ARGV.include? "--universal"
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make install"
  end
end
