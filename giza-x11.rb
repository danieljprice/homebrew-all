# Homebrew install script for giza
class GizaX11 < Formula
  desc "Scientific plotting library for C/Fortran"
  homepage "https://danieljprice.github.io/giza/"
  url "https://github.com/danieljprice/giza/releases/download/v1.5.0/giza-v1.5.0.tar.gz"
  version "1.5.0"
  sha256 "dfd9f257c620b22ebe9177e068f194ace7887d55ec5207e7cffec46115dc3a59"
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
