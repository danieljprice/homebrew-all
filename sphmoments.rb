# sph moments homebrew install script
class Sphmoments < Formula
  desc "Utility for computing smooth moment maps of astronomical data cubes using kernel interpolation"
  homepage "https://github.com/danieljprice/sphmoments"
  url "https://github.com/danieljprice/sphmoments/releases/download/v0.9.7/sphmoments-v0.9.7.tar.gz"
  version "0.9.7"
  sha256 "7b5b12c1010e9110f99eacd9fa4b166ede5a68a177f18284c201697e13cd6e0f"

  head "https://github.com/danieljprice/sphmoments.git"

  depends_on "cfitsio"
  depends_on "gcc"

  def install
    ENV.deparallelize
    system "make", "sphmoments", "SYSTEM=gfortran", "PREFIX=#{prefix}/", \
           "FITS_DIR=#{HOMEBREW_PREFIX}", "DOUBLEPRECISION=no"
    mkdir_p bin.to_s # equivalent to mkdir -p #{bin}
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
