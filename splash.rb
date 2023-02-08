# splash homebrew install script
class Splash < Formula
  desc "Smoothed Particle Hydrodynamics visualisation tool"
  homepage "http://users.monash.edu.au/~dprice/splash"
  url "https://github.com/danieljprice/splash/releases/download/v3.7.1/splash-v3.7.1.tar.gz"
  version "3.7.1"
  sha256 "dd419cce04d05e1a8700710d4b6960b6ac7a7c68f5804d2ae89e2b61a8f11205"

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
