# splash homebrew install script
class Splash < Formula
  desc "Smoothed Particle Hydrodynamics visualisation tool"
  homepage "http://users.monash.edu.au/~dprice/splash"
  url "http://users.monash.edu.au/~dprice/splash/releases/splash-2.9.0.tar.gz"
  sha256 "a3fa807ce2322421af3719fdc87d9214e6937c5ba004e7d8767d32f9e74d8cf9"
  depends_on "gcc"
  depends_on "giza"

  def install
    ENV.deparallelize
    system "make", "SYSTEM=gfortran", "PREFIX=#{prefix}/", "GIZA_DIR=#{HOMEBREW_PREFIX}", "CC=#{ENV.cc}"
    mkdir_p bin.to_s # equivalent to mkdir -p #{bin}
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
