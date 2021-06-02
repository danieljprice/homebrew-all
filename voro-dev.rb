# Voro++ homebrew install script, from development copy
class VoroDev < Formula
  desc "Voro++, a 3D cell-based Voronoi library"
  homepage "http://math.lbl.gov/voro++/"
  url "https://github.com/cpinte/voro", :using => :git
  version "0.4.6+"
  license "Redistribution of source and binary permitted with attribution and copyright"

  #Dir.chdir('voro')

  def install
    system "make","install","PREFIX=#{prefix}"
    pkgshare.install("examples")
    mv prefix/"man", share/"man"
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include "voro++.hh"
      double rnd() { return double(rand())/RAND_MAX; }
      int main() {
        voro::container con(0, 1, 0, 1, 0, 1, 6, 6, 6, false, false, false, 8);
        for (int i = 0; i < 20; i++) con.put(i, rnd(), rnd(), rnd());
        if (fabs(con.sum_cell_volumes() - 1) > 1.e-8) abort();
        con.draw_cells_gnuplot("test.gnu");
      }
    EOS
    system ENV.cxx, "test.cpp", "-I#{include}/voro++", "-L#{lib}",
                    "-lvoro++"
    system "./a.out"
    assert_predicate testpath/"test.gnu", :exist?
  end

end
