# Homebrew install script for giza
class Giza < Formula
  desc "Scientific plotting library for C/Fortran"
  homepage "https://danieljprice.github.io/giza/"
  url "https://github.com/danieljprice/giza/releases/download/v1.1.0/giza-1.1.0.tar.gz"
  sha256 "69f6b8187574eeb66ec3c1edadf247352b0ffebc6fc6ffbb050bafd324d3e300"
  depends_on "gcc" => :build
  depends_on :x11

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "false"
  end
end
