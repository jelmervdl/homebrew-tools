# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Fmptools < Formula
  desc "Convert FileMaker Pro databases to several convenient formats 📂"
  homepage "https://github.com/evanmiller/fmptools?tab=readme-ov-file"
  url "https://github.com/evanmiller/fmptools/releases/download/v0.2.1/fmptools-0.2.1.tar.gz"
  sha256 "5fb1518260a15dd5029fc7fef536b265b92a30a0961196fbf5a46aed7630bbe8"
  license "MIT"

  depends_on "yajl" => :recommended
  depends_on "sqlite" => :recommended
  depends_on "libxlsxwriter" => :optional

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "./configure", "--disable-silent-rules", *std_configure_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test fmptools`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
