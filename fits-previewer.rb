cask "fits-previewer" do
  version "0.5.0"
  # sha256 matches the ad-hoc zip from scripts/package.sh. Replace url with
  # the GitHub release, and replace sha256 again after notarizing.
  sha256 "dc7dbd51a9da69ae49a5cfd547a035904b2a1f05c76722c4f7aca5cac17408c9"
  url "https://github.com/danieljprice/fits-previewer/releases/download/v#{version}/FitsPreviewer.zip"
  name "FitsPreviewer"
  desc "Finder Quick Look for FITS images and data cubes"
  homepage "https://github.com/danieljprice/fits-previewer"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "FitsPreviewer.app"

  zap trash: [
    "~/Library/Containers/com.fitspreviewer.FitsPreviewer.Preview",
    "~/Library/Containers/com.fitspreviewer.FitsPreviewer.Thumbnail",
  ]
end
