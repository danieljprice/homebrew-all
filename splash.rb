# splash homebrew install script
class Splash < Formula
  desc "Smoothed Particle Hydrodynamics visualisation tool"
  homepage "http://users.monash.edu.au/~dprice/splash"
  url "https://github.com/danieljprice/splash/releases/download/v3.3.4/splash-v3.3.4.tar.gz"
  version "3.3.4"
  sha256 "8159f6be1bf1686708b844eb5e6c9a16a69b192c1924ccc016c93ad686b63ff6"
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
