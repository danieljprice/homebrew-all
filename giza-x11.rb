# Homebrew install script for giza
class GizaX11 < Formula
  desc "Scientific plotting library for C/Fortran"
  homepage "https://danieljprice.github.io/giza/"
  url "https://github.com/danieljprice/giza/releases/download/v1.3.2/giza-v1.3.2.tar.gz"
  version "1.3.2"
  sha256 "87f14679923ba729a13bc18026178be684d7620aaf0a5eb4172a4a1c9c87c033"
  depends_on "pkg-config" => :build
  depends_on "gcc" => :build
  depends_on "cairo" => :build
  depends_on "libx11"
  depends_on "freetype"

  head do
    url "https://github.com/danieljprice/giza", :using => :git
  end

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
