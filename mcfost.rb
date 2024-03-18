# mcfost homebrew install script
class Mcfost < Formula
  desc "Monte Carlo Radiative Transfer code"
  homepage "https://ipag.osug.fr/~pintec/mcfost/docs/html/index.html"
  url "https://github.com/cpinte/mcfost.git", :branch => "main"
  version "4.1.03"

  # specifying --HEAD installs from danieljprice fork (hack)
  head "https://github.com/danieljprice/mcfost.git", :branch => "main"

  depends_on "cfitsio"
  depends_on "gcc"
  depends_on "hdf5"
  depends_on "sprng2"
  depends_on "voro-dev"

  def install
    ENV.deparallelize
    Dir.chdir("src/")
    mkdir_p lib.to_s # equivalent to mkdir -p #{lib}
    mkdir_p include.to_s
    system "make", "all", "SYSTEM=gfortran", "MCFOST_INSTALL=#{HOMEBREW_PREFIX}", \
           "MCFOST_NO_XGBOOST=yes", "MCFOST_GIT=1", "CXX=#{ENV.cxx}", \
           "INCLUDE=-I#{HOMEBREW_PREFIX}/include", "LIBS=#{HOMEBREW_PREFIX}/lib"
    bin.install "mcfost"
    lib.install "libmcfost.a"
    include.install "mcfost2phantom.mod"
  end

  test do
    system "false"
  end
end
