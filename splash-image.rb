# splash homebrew install script
class Splash_image < Formula
  desc "Smoothed Particle Hydrodynamics image manipulation tools"
  homepage "http://users.monash.edu.au/~dprice/splash"
  url "https://github.com/danieljprice/splash", :using => :git
  depends_on "gcc"
  depends_on "cfitsio"

  #head do
  #  url "https://github.com/danieljprice/splash", :using => :git
  #end

  def install
    ENV.deparallelize
    system "make", "splash-image", "SYSTEM=gfortran", "PREFIX=#{prefix}/", "FITS_DIR=#{HOMEBREW_PREFIX}"
    mkdir_p bin.to_s # equivalent to mkdir -p #{bin}
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
