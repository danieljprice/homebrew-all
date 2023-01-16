# swarp homebrew install script
class Swarp < Formula
  desc "Resamples and co-adds together FITS images using any astrometric projection"
  homepage "https://www.astromatic.net/software/swarp/"
  url "https://github.com/astromatic/swarp/archive/refs/tags/2.41.5.tar.gz"
  sha256 "954cebb1e5b1b4f7791b9b38b4e0f07bb2233775a97d6254def5c24b6b5a7f31"
  license "GPL-3.0-or-later"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "gcc" => :build

  depends_on "cfitsio"

  def install
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}", "CXXLIB=-lc++"
    system "make", "install"
  end

  test do
    system "swarp"
  end
end
