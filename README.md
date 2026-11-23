# homebrew-tap

Homebrew formulas for [lh330250925](https://github.com/lh330250925) projects.

## Install `konyac`

```bash
brew install lh330250925/tap/konyac
```

### Start background daemon

```bash
mkdir -p ~/.config/konyac
cp "$(brew --prefix)/share/konyac/config.example.toml" ~/.config/konyac/config.toml
# Edit ~/.config/konyac/config.toml to add your API key/service, then:
brew services start konyac
```

Main repository: https://github.com/lh330250925/Konyac
