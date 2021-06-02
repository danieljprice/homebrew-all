# sprng homebrew install script
class Sprng < Formula
  desc "The Scalable Parallel Random Number Generators Library"
  homepage "http://sprng.org"
  url "http://sprng.org/Version5.0/sprng5.tar.bz2"
  version "5.0"
  sha256 "9172a495472cc24893e7489ce9b5654300dc60cba4430e436ce50d28eb749a66"
  license "Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International"
  depends_on "gcc" => :build

  def install
    system "sed -i.tmp 's/stdc++/c++/g' EXAMPLES/F77/Makefile.am"
    system "./configure", "--prefix=#{prefix}", "CXXLIB=-lc++"
    system "make", "install"
  end

  test do
    system "checksprng"
  end
end
