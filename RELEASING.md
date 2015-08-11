* Update version number and date in .gemspec
* Run bundler to update Gemfile.lock with the new updated dependency for the gem (don't ask why it requires itself)
* Push to master
* Ensure travis tests are passing
* Create and push a new tag for the release (`git tag v0.0.x; git push --tags`)
* Run `rake build`
* Ensure it installs with `rake install`
* Create a release in Github's tags and attach the .gem file to the release.
* Finally, run `rake release` to push the new version to RubyGems