# splash homebrew install script
class Splash < Formula
  desc "Smoothed Particle Hydrodynamics visualisation tool"
  homepage "http://users.monash.edu.au/~dprice/splash"
  url "https://github.com/danieljprice/splash/releases/download/v4.0.1/splash-v4.0.1.tar.gz"
  version "4.0.1"
  sha256 "f6c409a556992b204b3793863fd97e2917b0e2e86c720c181eeffd182582b284"
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
