# mcfost homebrew install script
class Mcfost < Formula
  desc "Monte Carlo Radiative Transfer code"
  homepage "https://ipag.osug.fr/~pintec/mcfost/docs/html/index.html"
  url "https://github.com/cpinte/mcfost", :using => :git
  version "3.0.42"
  depends_on "gcc"
  depends_on "hdf5"
  depends_on "cfitsio"
  depends_on "sprng2"
  depends_on "voro-dev"

  head do
    url "https://github.com/cpinte/mcfost", :using => :git, branch: "AtomicTransfer"
  end

  def install
    ENV.deparallelize
    Dir.chdir('src/')
    mkdir_p lib.to_s # equivalent to mkdir -p #{lib}
    mkdir_p include.to_s
    system "make","all","SYSTEM=gfortran", "MCFOST_INSTALL=#{HOMEBREW_PREFIX}", \
           "MCFOST_NO_XGBOOST=yes","MCFOST_GIT=1","CXX=#{ENV.cxx}", \
           "INCLUDE=-I#{HOMEBREW_PREFIX}/include","LIBS=#{HOMEBREW_PREFIX}/lib"
    bin.install Dir["mcfost"]
    lib.install Dir["libmcfost.a"]
    include.install Dir["mcfost2phantom.mod"]
  end

  test do
    system "false"
  end
end
