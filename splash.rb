# splash homebrew install script
class Splash < Formula
  desc "Smoothed Particle Hydrodynamics visualisation tool"
  homepage "http://users.monash.edu.au/~dprice/splash"
  url "http://users.monash.edu.au/~dprice/splash/releases/splash-2.10.0.tar.gz"
  sha256 "a5ca28e0c2f2060d2bc5443f4960dec36d0e7abf893ef3c192e3b764e4c98178"
  depends_on "gcc"
  depends_on "giza"
  depends_on "hdf5"

  head do
    url "https://github.com/danieljprice/splash", :using => :git
  end

  def install
    ENV.deparallelize
    system "make", "all", "gadgethdf5", "falcON", "amuse_hdf5", "cactus_hdf5", "SYSTEM=gfortran", "PREFIX=#{prefix}/", "GIZA_DIR=#{HOMEBREW_PREFIX}", "CC=#{ENV.cc}", "HDF5ROOT=#{HOMEBREW_PREFIX}"
    mkdir_p bin.to_s # equivalent to mkdir -p #{bin}
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
