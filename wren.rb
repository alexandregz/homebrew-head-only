class Wren < Formula
  homepage "http://munificent.github.io/wren/"
  head "https://github.com/munificent/wren.git"

  depends_on "pkg-config" => :build

  def install
    system "make"
    bin.install "wren"
    inreplace "Makefile", "include/wren.h", "../include/wren.h"
    libexec.install Dir["Makefile", "script", "src", "test"]
    prefix.install Dir["include"]
  end

  test do
    cd libexec do
      system "make", "test"
    end
  end
end
