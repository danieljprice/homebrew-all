class Finufft < Formula
  desc "Flatiron Institute Nonuniform Fast Fourier Transform"
  homepage "https://finufft.readthedocs.io/"
  url "https://github.com/flatironinstitute/finufft/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "0dac7f8f2648fbf5c448cf23a331766e29a7c87b86365d28efb1793b4b023ac1"
  license "Apache-2.0"

  depends_on "cmake" => :build
  depends_on "fftw"
  depends_on "gcc" # for OpenMP support
  depends_on "libomp"

  def install
    system "cmake", "-S", ".", "-B", "build",
           "-DFINUFFT_BUILD_TESTS=OFF",
           "-DCMAKE_INSTALL_PREFIX=#{prefix}",
           "-DCMAKE_C_COMPILER=#{ENV.cc}",
           "-DCMAKE_CXX_COMPILER=#{ENV.cxx}"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "#{bin}/finufft_test"
  end
end 