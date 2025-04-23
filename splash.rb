# splash homebrew install script
class Splash < Formula
  desc "Smoothed Particle Hydrodynamics visualisation tool"
  homepage "http://users.monash.edu.au/~dprice/splash"
  url "https://github.com/danieljprice/splash/releases/download/v3.11.3/splash-v3.11.3.tar.gz"
  version "3.11.3"
  sha256 "f37c82217ba9e7aa36ed03e004fb5bc87a98e7ee215bffb3d4750a31fc0c709d"
  head "https://github.com/danieljprice/splash.git"

  depends_on "cfitsio"
  depends_on "gcc"
  depends_on "giza-x11"
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
