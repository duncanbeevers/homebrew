require 'formula'

class Flex4 <Formula
  url 'http://fpdownload.adobe.com/pub/flex/sdk/builds/flex4/flex_sdk_4.1.0.16076_mpl.zip'
  homepage 'http://opensource.adobe.com/wiki/display/flexsdk/Flex+4'
  sha1 '1cf0814559df81ba3ab9543a4f1864e33df558ef'
  version '4.1.0.16076'

  def install
    # Remove Windows files
    rm Dir['bin/*.{bat,exe,config}']

    # Remove samples
    rm_rf prefix+'samples'

    Dir[Dir.pwd+'/bin/*'].each do |f|
      (bin+File.basename(f)).write(
        File.read(f).sub(/#!\/bin\/sh/) do |m|
          "%s\nFLEX_HOME=%s" % [ m, libexec ]
        end)
    end

    libexec.install Dir['*']

  end
end

