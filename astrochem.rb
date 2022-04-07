# astrochem homebrew install script
class Astrochem < Formula
  desc "A code to compute the abundances of chemical species in the interstellar medium"
  homepage "https://github.com/smaret/astrochem"
  url "https://github.com/smaret/astrochem", :using => :git
  version "0.9"
  depends_on "gcc"
  depends_on "hdf5"
  depends_on "sundials"
  depends_on "automake"
  depends_on "libtool"
  depends_on "python@3.10"
  depends_on "numpy"

  def install
    system "./bootstrap"
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
