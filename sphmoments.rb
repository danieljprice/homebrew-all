# sph moments homebrew install script
class Sphmoments < Formula
  desc "Utility for computing smooth moment maps of astronomical data cubes using kernel interpolation"
  homepage "https://github.com/danieljprice/sphmoments"
  url "https://github.com/danieljprice/sphmoments/releases/download/v0.9.5/sphmoments-v0.9.5.tar.gz"
  version "0.9.5"
  sha256 "7d128a361dfa7fb85cb09b688a5747d51366b36131fb526e0f478b7a81092818"

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
