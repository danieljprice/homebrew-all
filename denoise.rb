# splash homebrew install script
class Denoise < Formula
  desc "Utility for de-noising astronomical images using adaptive kernel interpolation"
  homepage "http://users.monash.edu.au/~dprice/splash"
  url "http://users.monash.edu.au/~dprice/splash/releases/splash-2.10.0.tar.gz"
  sha256 "a5ca28e0c2f2060d2bc5443f4960dec36d0e7abf893ef3c192e3b764e4c98178"
  depends_on "gcc"
  depends_on "cfitsio"

  head do
    url "https://github.com/danieljprice/splash", :using => :git
  end

  def install
    ENV.deparallelize
    system "make", "denoise", "SYSTEM=gfortran", "PREFIX=#{prefix}/", "CC=#{ENV.cc}", "FITS_DIR=#{HOMEBREW_PREFIX}"
    mkdir_p bin.to_s # equivalent to mkdir -p #{bin}
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
