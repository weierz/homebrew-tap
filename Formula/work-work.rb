class WorkWork < Formula
  desc "Estimate and record macOS clock-out time from display wake events"
  homepage "https://github.com/weierz/work-work"
  url "https://github.com/weierz/work-work/releases/download/v0.4.0/work-work-aarch64-apple-darwin.tar.gz"
  sha256 "78599585756ebfdfa706164bd61a8a6ae4e2fe657bc6f232b3aa194e5eea9675"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "ww"
  end

  service do
    run [opt_bin/"ww", "daemon"]
    keep_alive true
    log_path var/"log/work-work.log"
    error_log_path var/"log/work-work.error.log"
  end

  test do
    assert_match "ww — estimate clock-out time", shell_output("#{bin}/ww help")
  end
end
