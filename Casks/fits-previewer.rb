cask "fits-previewer" do
  version "0.7.1"
  sha256 "bd6b22d6a1248c4c2ecfc05e5cde2da7e7e476bc36216decc525193b5df9de9e"

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

  # Drop the Quick Look extensions from PlugInKit before the app is removed,
  # so System Settings → Login Items & Extensions → Quick Look clears.
  uninstall_preflight_steps do
    terminate_process "FitsPreviewer", must_succeed: false
    terminate_process "FitsPreview", must_succeed: false
    terminate_process "FitsThumbnail", must_succeed: false
    run "/usr/bin/pluginkit",
        args:         ["-r", "{{appdir}}/FitsPreviewer.app/Contents/PlugIns/FitsPreview.appex"],
        must_succeed: false
    run "/usr/bin/pluginkit",
        args:         ["-r", "{{appdir}}/FitsPreviewer.app/Contents/PlugIns/FitsThumbnail.appex"],
        must_succeed: false
    run "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
        args:         ["-u", "{{appdir}}/FitsPreviewer.app"],
        must_succeed: false
  end

  uninstall_postflight_steps do
    run "/usr/bin/qlmanage", args: ["-r"], must_succeed: false
    run "/usr/bin/qlmanage", args: ["-r", "cache"], must_succeed: false
  end

  zap trash: [
    "~/Library/Containers/com.fitspreviewer.FitsPreviewer",
    "~/Library/Containers/com.fitspreviewer.FitsPreviewer.Preview",
    "~/Library/Containers/com.fitspreviewer.FitsPreviewer.Thumbnail",
  ]

  caveats <<~EOS
    Launch FitsPreviewer once to register Quick Look extension.
    Open from Applications, then press space on a .fits or .fits.gz file in Finder.
  EOS
end
