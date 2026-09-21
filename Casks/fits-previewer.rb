cask "fits-previewer" do
  version "0.7.0"
  sha256 "27a54961d24b34643d7318d9dff6169e8544afd3d0104bd54bace2b94fadf8e9"

  url "https://github.com/danieljprice/fits-previewer/releases/download/v#{version}/FitsPreviewer.zip"
  name "FitsPreviewer"
  desc "Finder Quick Look for FITS images and data cubes"
  homepage "https://github.com/danieljprice/fits-previewer"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "FitsPreviewer.app"

  # An ad-hoc signature plus the download quarantine flag makes macOS
  # report the app as damaged.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/FitsPreviewer.app"],
        must_succeed: false
  end

  zap trash: [
    "~/Library/Containers/com.fitspreviewer.FitsPreviewer.Preview",
    "~/Library/Containers/com.fitspreviewer.FitsPreviewer.Thumbnail",
  ]
end
