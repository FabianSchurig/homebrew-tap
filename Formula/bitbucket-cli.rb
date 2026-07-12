class BitbucketCli < Formula
  desc "A Go-based Bitbucket Cloud CLI tool focusing on low maintenance via OpenAPI specs"
  homepage "https://github.com/FabianSchurig/bitbucket-cli"
  version "0.17.0" # Dynamically managed by CI automation

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FabianSchurig/bitbucket-cli/releases/download/v#{version}/bb-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "ce8831f3f490578318b8602ba806308692aba337ea4fe6baeccec6a464bb9876"
    else
      url "https://github.com/FabianSchurig/bitbucket-cli/releases/download/v#{version}/bb-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "bc8e7e29acca6a78ed9448eb64c6334174ae6775bd69437f5f13841ca345ccfe"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/FabianSchurig/bitbucket-cli/releases/download/v#{version}/bb-cli_#{version}_linux_arm64.tar.gz"
      sha256 "f2661d4724e381933e041ed467b5393464bd9d70ce38cec73885417b10e31903"
    elsif Hardware::CPU.intel?
      url "https://github.com/FabianSchurig/bitbucket-cli/releases/download/v#{version}/bb-cli_#{version}_linux_amd64.tar.gz"
      sha256 "eadcf453f61a5f0acaff6cc335c983f91b56b2450d0f9865d925f16b7b24d7b3"
    end
  end

  def install
    # Explicitly extracts and mounts the compiled Go application binary 
    bin.install "bb-cli"
  end

  test do
    system "#{bin}/bb-cli", "--version"
  end
end
