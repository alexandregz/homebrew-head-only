class Wren < Formula
  homepage "http://munificent.github.io/wren/"
  head "https://github.com/munificent/wren.git"

  depends_on "pkg-config" => :build

  def install
    system "make"
    bin.install "wren"
    libexec.install Dir["Makefile", "include", "script", "src", "test"]
  end

  test do
    cd libexec do
      system "make", "test"
    end
  end
end
