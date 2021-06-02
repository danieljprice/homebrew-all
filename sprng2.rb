# sprng homebrew install script, for version 2.0 only
class Sprng2 < Formula
  desc "The Scalable Parallel Random Number Generators Library"
  homepage "http://sprng.org"
  url "http://sprng.org/Version2.0/sprng2.0b.tar.gz"
  version "2.0"
  sha256 "8985d7cae4f20f57889bc7ba11dfed226a02057d396731f4a5cc174704131ac2"
  license "Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International"

  def install
    # a few important things here:
    # 1) compiler is Clang by default
    #
    # 2) code does not compile without -Wno-implicit-function-declaration,
    #    an alternative is to supply a patch adding the missing <stdlib.h> declarations
    #
    # 3) need -DAdd_ instead of -DAdd__ so Fortran programs can successfully link
    #    against the clang-compiled libsprng
    #
    # 4) we have disabled the GMP functionality to avoid another dependency
    #    this is normally done in make.CHOICES but we just override the flags here
    #
    # 5) a bunch of the test programs fail to compile, but the basic library succeeds
    #
    system "make", "-B", "CC=#{ENV.cc} -Wno-implicit-function-declaration",
           "FFXN=-DAdd_", "GMPLIB=", "PMLCGDEF="
    #
    # copy the library and .h files to the install directory
    #
    lib.install Dir["lib/libsprng.a"]
    include.install Dir["include/*.h"]
  end

  test do
    system "checksprng"
  end
end
