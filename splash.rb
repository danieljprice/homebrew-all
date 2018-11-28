# splash homebrew install script
class Splash < Formula
  desc "Smoothed Particle Hydrodynamics visualisation tool"
  homepage "http://users.monash.edu.au/~dprice/splash"
  url "http://users.monash.edu.au/~dprice/splash/releases/splash-2.8.0.tar.gz"
  sha256 "de06b159846bd20717a55ec7cc9420e0fd86ab38dc66dc74b1f61b77b4d24fce"
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
