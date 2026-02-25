class Dutils < Formula
  desc "CLI tools to speed up working with docker compose projects"
  homepage "https://github.com/lukasmay/d-utils"
  url "file:///Users/lukasmay/git/d-utils", using: :git, branch: "main"
  version "2.0.0-dev"

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
