# splash homebrew install script
class ActionTests < Formula
  desc "Utility for de-noising astronomical images using adaptive kernel interpolation"
  homepage "http://github.com/danieljprice/denoise"
  url "https://github.com/danieljprice/action-tests/releases/download/v0.1.24/action-tests-v0.1.24.tar.gz"
  version "/0.1.24"
  sha256 "63d7ecad80d7a97b3961d1ba46a47ffba3038bba3de8c49c476d34acfe79e26a"
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
