# splash homebrew install script
class ActionTests < Formula
  desc "Utility for de-noising astronomical images using adaptive kernel interpolation"
  homepage "http://github.com/danieljprice/denoise"
  url "https://github.com/danieljprice/action-tests/releases/download/v0.1.25/action-tests-v0.1.25.tar.gz"
  version "0.1.25"
  sha256 "9e96789d21d02bc798eed0b82a837930cdb50afd3ef403c7443a39f3a33ff921"
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
