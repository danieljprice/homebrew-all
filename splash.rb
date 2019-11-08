# splash homebrew install script
class Splash < Formula
  desc "Smoothed Particle Hydrodynamics visualisation tool"
  homepage "http://users.monash.edu.au/~dprice/splash"
  url "http://users.monash.edu.au/~dprice/splash/releases/splash-2.9.1.tar.gz"
  sha256 "212bbe16c56d1a009acbd263689ef6a30052d5bb4878aad345d97927fbdd1996"
  depends_on "gcc"
  depends_on "giza"
  depends_on "hdf5"

  def install
    ENV.deparallelize
    system "make", "all", "gadgethdf5", "falcON", "amuse_hdf5", "cactus_hdf5", "SYSTEM=gfortran", "PREFIX=#{prefix}/", "GIZA_DIR=#{HOMEBREW_PREFIX}", "CC=#{ENV.cc}", "HDF5_DIR=#{HOMEBREW_PREFIX}"
    mkdir_p bin.to_s # equivalent to mkdir -p #{bin}
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
