# splash homebrew install script
class Splash < Formula
  desc "Smoothed Particle Hydrodynamics visualisation tool"
  homepage "http://users.monash.edu.au/~dprice/splash"
  url "http://users.monash.edu.au/~dprice/splash/releases/splash-2.10.1.tar.gz"
  sha256 "0991a11666a1a87d1cde7ca2623bb335557d5dd0717af570bcc5d1f273bab76a"
  depends_on "gcc"
  depends_on "giza"
  depends_on "hdf5"
  depends_on "cfitsio"

  head do
    url "https://github.com/danieljprice/splash", :using => :git
  end

  def install
    ENV.deparallelize
    system "make", "all", "gadgethdf5", "falcON", "amuse_hdf5", "cactus_hdf5", "fits", "SYSTEM=gfortran", "PREFIX=#{prefix}/", "GIZA_DIR=#{HOMEBREW_PREFIX}", "CC=#{ENV.cc}", "HDF5ROOT=#{HOMEBREW_PREFIX}", "FITS_DIR=#{HOMEBREW_PREFIX}"
    mkdir_p bin.to_s # equivalent to mkdir -p #{bin}
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
