# Homebrew install script for giza
class GizaX11 < Formula
  desc "Scientific plotting library for C/Fortran"
  homepage "https://danieljprice.github.io/giza/"
  url "https://github.com/danieljprice/giza/releases/download/v1.2.0/giza-v1.2.0.tar.gz"
  version "1.2.0"
  sha256 "607c557fa5e4fadb7ebeab9e5459c8591e461552972e08722e602f4b4280372d"
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
