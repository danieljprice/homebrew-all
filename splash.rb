# splash homebrew install script
class Splash < Formula
  desc "Smoothed Particle Hydrodynamics visualisation tool"
  homepage "http://users.monash.edu.au/~dprice/splash"
  url "https://github.com/danieljprice/splash/releases/download/v3.10.3/splash-v3.10.3.tar.gz"
  version "3.10.3"
  sha256 "ddda7553d70cc87761451f55c226182ff56b0ba3c7f8dd2f386cdf441f79fc80"
  head "https://github.com/danieljprice/splash.git"

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
