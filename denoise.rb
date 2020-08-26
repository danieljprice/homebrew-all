# splash homebrew install script
class Denoise < Formula
  desc "Utility for de-noising astronomical images using adaptive kernel interpolation"
  homepage "http://github.com/danieljprice/denoise"
  url "https://github.com/danieljprice/denoise/releases/download/v0.2.0/denoise-v0.2.0.tar.gz"
  version "0.2.0"
  sha256 "c8cc28ba14ae641ce8b51f8300c200b5b83e3dce7abc6cff529de5140104ce5e"
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
