# splash homebrew install script
class Splash < Formula
  desc "Smoothed Particle Hydrodynamics visualisation tool test repo"
  homepage "http://users.monash.edu.au/~dprice/splash"
  url "https://github.com/danieljprice/splash-release-testing/releases/download/v3.12.0/splash-v3.12.0.tar.gz"
  version "3.12.0"
  sha256 "64b0a7d8124bdfde083a07f56b6b34dc1aa77525a2a02e229cc5787a756d68dd"
  head "https://github.com/danieljprice/splash-release-testing.git"

  depends_on "cfitsio"
  depends_on "gcc"
  depends_on "giza"
  depends_on "hdf5"

  def install
    ENV.deparallelize
    system "make", "all", "HDF5=yes", "FITS=yes", "SYSTEM=gfortran", "PREFIX=#{prefix}/", \
           "GIZA_DIR=#{HOMEBREW_PREFIX}", "CC=#{ENV.cc}", "HDF5ROOT=#{HOMEBREW_PREFIX}", \
           "FITS_DIR=#{HOMEBREW_PREFIX}"
    mkdir_p bin.to_s # equivalent to mkdir -p #{bin}
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
