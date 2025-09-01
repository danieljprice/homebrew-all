# mcfost homebrew install script
class Mcfost < Formula
  desc "Monte Carlo Radiative Transfer code"
  homepage "https://ipag.osug.fr/~pintec/mcfost/docs/html/index.html"
  url "https://github.com/cpinte/mcfost.git", :branch => "main"
  version "4.1.10"

  # specifying --HEAD installs from DJP's fork instead
  head "https://github.com/danieljprice/mcfost.git", :branch => "main"

  depends_on "cfitsio"
  depends_on "gcc"
  depends_on "hdf5"
  depends_on "sprng2"
  depends_on "voro-dev"

  def install
    ENV.deparallelize

    Dir.chdir("src") do
      system "make", "all", "SYSTEM=gfortran", "MCFOST_INSTALL=#{HOMEBREW_PREFIX}", \
             "MCFOST_NO_XGBOOST=yes", "MCFOST_GIT=1", "CXX=#{ENV.cxx}", \
             "INCLUDE=-I#{HOMEBREW_PREFIX}/include", "LIBS=#{HOMEBREW_PREFIX}/lib"
      bin.install "mcfost"
      lib.install "libmcfost.a"
      include.install "mcfost2phantom.mod"
    end
  end

  test do
    # Create a temporary directory for data files
    utils_dir = "mcfost_utils"
    Dir.mkdir(utils_dir) unless Dir.exist?(utils_dir)

    # set MCFOST_UTILS
    ENV["MCFOST_UTILS"] = File.expand_path(utils_dir)
    ENV["MCFOST_GIT"] = "1"

    # Run mcfost setup to download files to temp directory
    system "#{bin}/mcfost", "-setup"

    system "#{bin}/mcfost", "--help"
  end

  def caveats
    <<~EOS
      MCFOST requires the MCFOST_UTILS environment variable to be set for proper operation.

      Add this to your shell profile (~/.zshrc, ~/.bash_profile, etc.):
        export MCFOST_UTILS=~/mcfost_utils

      Then download and install the data files as follows:
        mcfost -setup

      Check the MCFOST documentation for details.
    EOS
  end
end
