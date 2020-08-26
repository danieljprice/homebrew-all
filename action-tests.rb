# splash homebrew install script
class ActionTests < Formula
  desc "Utility for de-noising astronomical images using adaptive kernel interpolation"
  homepage "http://github.com/danieljprice/denoise"
  url "https://github.com/danieljprice/action-tests/releases/download/v0.1.26/action-tests-v0.1.26.tar.gz"
  version "0.1.26"
  sha256 "17585b421057b2c134460f817d1f55d91c5dcff9069d988550e7ee566bc77630"
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
