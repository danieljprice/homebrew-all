# Homebrew install script for giza
class GizaX11 < Formula
  desc "Scientific plotting library for C/Fortran"
  homepage "https://danieljprice.github.io/giza/"
  url "https://github.com/danieljprice/giza/releases/download/v2.0.1/giza-v2.0.1.tar.gz"
  version "2.0.1"
  sha256 "a62b0fc68712ed12ede18a7adec0d49a7784f266a11d71cb16ad4890c396986f"
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
