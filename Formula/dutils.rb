class Dutils < Formula
  desc "CLI tools to speed up working with docker compose projects"
  homepage "https://github.com/lukasmay/d-utils"
  url "https://github.com/lukasmay/d-utils/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "ec63707770cbf700c0a5be0183b89e158f1734a2be278d64e70922c139e55dd0"
  license "MIT"

  def install
    # Install the main executable
    bin.install "bin/dutils"

    # Create symlinks for the short commands
    %w[dstart dstop dlist drestart dproject].each do |cmd|
      bin.install_symlink "dutils" => cmd
    end

    # Install completions
    bash_completion.install "completions/dutils.bash" => "dutils"
    zsh_completion.install "completions/_dutils"
  end

  def caveats
    <<~EOS
      dutils has been installed.

      To use zsh completions, ensure you have the following in your ~/.zshrc:
        autoload -Uz compinit
        compinit
    EOS
  end

  test do
    system "#{bin}/dutils", "--version"
  end
end
