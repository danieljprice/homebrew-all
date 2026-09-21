cask "fits-previewer" do
  version "0.6.0"
  sha256 "fe5cf32c249fdacf4afd7779d770f70601b89effe5bd4ce0e2d0407ae9a0d0e4"

  url "https://github.com/danieljprice/fits-previewer/releases/download/v#{version}/FitsPreviewer.zip"
  name "FitsPreviewer"
  desc "Finder Quick Look for FITS images and data cubes"
  homepage "https://github.com/danieljprice/fits-previewer"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "FitsPreviewer.app"

  # An ad-hoc signature plus the download quarantine flag makes macOS
  # report the app as damaged.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/FitsPreviewer.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Containers/com.fitspreviewer.FitsPreviewer.Preview",
    "~/Library/Containers/com.fitspreviewer.FitsPreviewer.Thumbnail",
  ]
end
