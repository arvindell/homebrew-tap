class MfSpeak < Formula
  desc "A spicy little command wrapper that provides audible feedback with attitude"
  homepage "https://github.com/arvindell/mf"
  url "https://github.com/arvindell/mf/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "4db637461fb807abc84159f4850715b43ee19be59cee64c4de2375f4d2225180"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    # Symlink the binary to just "mf"
    bin.install_symlink "#{bin}/mf" => "mf"
  end

  test do
    assert_match "mf-speak", shell_output("#{bin}/mf --version")
  end
end 