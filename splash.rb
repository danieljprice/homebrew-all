# splash homebrew install script
class Splash < Formula
  desc "Smoothed Particle Hydrodynamics visualisation tool"
  homepage "http://users.monash.edu.au/~dprice/splash"
  url "https://github.com/danieljprice/splash/releases/download/v3.2.0/splash-v3.2.0.tar.gz"
  version "3.2.0"
  sha256 "34516392354fbffaa582ef4079ecc712ceb1cd16acbde98251b524aa3d439f3a"
  depends_on "gcc"
  depends_on "giza-x11"
  depends_on "hdf5"
  depends_on "cfitsio"

  head do
    url "https://github.com/danieljprice/splash", :using => :git
  end

  def install
    ENV.deparallelize
    system "make", "all", "HDF5=yes", "FITS=yes", "SYSTEM=gfortran", "PREFIX=#{prefix}/", "GIZA_DIR=#{HOMEBREW_PREFIX}", "CC=#{ENV.cc}", "HDF5ROOT=#{HOMEBREW_PREFIX}", "FITS_DIR=#{HOMEBREW_PREFIX}"
    mkdir_p bin.to_s # equivalent to mkdir -p #{bin}
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
