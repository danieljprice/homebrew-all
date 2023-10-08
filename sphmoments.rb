# sph moments homebrew install script
class Sphmoments < Formula
  desc "Utility for computing smooth moment maps of astronomical data cubes using kernel interpolation"
  homepage "https://github.com/danieljprice/sphmoments"
  url "https://github.com/danieljprice/denoise/releases/download/v0.8.0/sphmoments-v0.8.0.tar.gz"
  sha256 "f75a84cf9dc408af5b99db4fbccfbc48cb254cec3cb35342a633abeece10f195"

  head "https://github.com/danieljprice/sphmoments.git"

  depends_on "cfitsio"
  depends_on "gcc"

  def install
    ENV.deparallelize
    system "make", "sphmoments", "SYSTEM=gfortran", "PREFIX=#{prefix}/", \
           "FITS_DIR=#{HOMEBREW_PREFIX}", "DOUBLEPRECISION=no"
    mkdir_p bin.to_s # equivalent to mkdir -p #{bin}
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
