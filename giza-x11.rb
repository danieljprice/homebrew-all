# Homebrew install script for giza
class GizaX11 < Formula
  desc "Scientific plotting library for C/Fortran"
  homepage "https://danieljprice.github.io/giza/"
  url "https://github.com/danieljprice/giza/releases/download/v1.4.4/giza-v1.4.4.tar.gz"
  version "1.4.4"
  sha256 "0dc9ba9038104efddbd3171264f984727254aebbcdd0438133a07cc7e0355a08"
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
