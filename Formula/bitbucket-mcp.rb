class BitbucketMcp < Formula
  desc "An MCP server for interacting with Bitbucket via AI agents"
  homepage "https://github.com/FabianSchurig/bitbucket-cli"
  version "0.17.0" # Dynamically managed by CI automation

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FabianSchurig/bitbucket-cli/releases/download/v#{version}/bb-mcp_#{version}_darwin_arm64.tar.gz"
      sha256 "6876b5ba1d242197d575f0e870092640764b0877693e7a42bba301898a8ae8d8"
    else
      url "https://github.com/FabianSchurig/bitbucket-cli/releases/download/v#{version}/bb-mcp_#{version}_darwin_amd64.tar.gz"
      sha256 "5b3db67a76595e71659a68a7d10e38555cba32a52ad02905d5a3ac12d43cffda"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/FabianSchurig/bitbucket-cli/releases/download/v#{version}/bb-mcp_#{version}_linux_arm64.tar.gz"
      sha256 "4dca84e445235c289954650b4ae3083d5611f3aad7d7b1a0f6186ecb9cba9366"
    elsif Hardware::CPU.intel?
      url "https://github.com/FabianSchurig/bitbucket-cli/releases/download/v#{version}/bb-mcp_#{version}_linux_amd64.tar.gz"
      sha256 "36cf03718c8c0ada71143dbdaa060e5138ce133f71c39e654d670644039a4284"
    end
  end

  def install
    # Explicitly extracts and mounts the compiled Go application binary 
    bin.install "bb-mcp"
  end

  test do
    assert_match "stdio", shell_output("#{bin}/bb-mcp --help", 2)
  end
end
