class Konyac < Formula
  desc "Lightweight AI translation daemon and CLI for Linux and macOS"
  homepage "https://github.com/lh330250925/Konyac"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lh330250925/Konyac/releases/download/v#{version}/konyac-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "38880df5b5348e3635a1855abc1259cce3387fed2058d83a1f87497a43a84717"
    end
    on_intel do
      url "https://github.com/lh330250925/Konyac/releases/download/v#{version}/konyac-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "5d8720e66179a0a26c3ad903132357ddb4a4e39cf88fdf2d8047a42198e3b8a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lh330250925/Konyac/releases/download/v#{version}/konyac-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9252d78cb90f32a68d3d736456c92865547e08b98a6fa1b7b996565e6de1233d"
    end
    on_intel do
      url "https://github.com/lh330250925/Konyac/releases/download/v#{version}/konyac-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7c84954b6fef5122a71846405207c748c141de55aa9039b91e2335529945ba3a"
    end
  end

  def install
    bin.install "konyac"
    pkgshare.install "config.example.toml"
  end

  def caveats
    <<~EOS
      Create your configuration before starting the daemon:
        mkdir -p ~/.config/konyac
        cp #{opt_pkgshare}/config.example.toml ~/.config/konyac/config.toml

      Then start the background daemon with:
        brew services start konyac
    EOS
  end

  service do
    run [opt_bin/"konyac", "serve"]
    keep_alive true
    log_path var/"log/konyac.log"
    error_log_path var/"log/konyac.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/konyac --version")
  end
end
