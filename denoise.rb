# splash homebrew install script
class Denoise < Formula
  desc "Utility for de-noising astronomical images using adaptive kernel interpolation"
  homepage "http://github.com/danieljprice/denoise"
  url "https://github.com/danieljprice/denoise/releases/download/v0.1.4/denoise-v0.1.4.tar.gz"
  sha256 "705f4a6672784ab65e30eb0b34d89f120128f55ddcf0842c2300ef0afd763b64"
  depends_on "gcc"
  depends_on "cfitsio"

  head do
    url "https://github.com/danieljprice/denoise", :using => :git
  end

  def install
    ENV.deparallelize
    system "make", "denoise", "SYSTEM=gfortran", "PREFIX=#{prefix}/", "FITS_DIR=#{HOMEBREW_PREFIX}", "DOUBLEPRECISION=no"
    mkdir_p bin.to_s # equivalent to mkdir -p #{bin}
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
