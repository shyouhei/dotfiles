#! /bin/bash

# 1. Update Homebrew's package metadata
brew update

# 2. Download formulae and their dependencies
brew bundle list --formula | parallel -j7 -- brew fetch --formula --deps '{}'

# 3. Download cask installers
brew bundle list --cask | parallel -j7 -- brew fetch --cask '{}'

# 4. Install or upgrade everything
brew bundle install