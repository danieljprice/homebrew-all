# splash homebrew install script
class Denoise < Formula
  desc "Utility for de-noising astronomical images using adaptive kernel interpolation"
  homepage "https://github.com/danieljprice/denoise"
  url "https://github.com/danieljprice/denoise/releases/download/v0.2.1/denoise-v0.2.1.tar.gz"
  sha256 "f75a84cf9dc408af5b99db4fbccfbc48cb254cec3cb35342a633abeece10f195"

  head "https://github.com/danieljprice/denoise.git"

  depends_on "cfitsio"
  depends_on "gcc"

  def install
    ENV.deparallelize
    system "make", "denoise", "SYSTEM=gfortran", "PREFIX=#{prefix}/", \
           "FITS_DIR=#{HOMEBREW_PREFIX}", "DOUBLEPRECISION=no"
    mkdir_p bin.to_s # equivalent to mkdir -p #{bin}
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "false"
  end
end
