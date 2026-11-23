# homebrew-tap

Homebrew formulas for [lhxn](https://github.com/lhxn) projects.

## Install `konyac`

```bash
brew install lhxn/tap/konyac
```

### Start background daemon

```bash
mkdir -p ~/.config/konyac
cp "$(brew --prefix)/share/konyac/config.example.toml" ~/.config/konyac/config.toml
# Edit ~/.config/konyac/config.toml to add your API key/service, then:
brew services start konyac
```

Main repository: https://github.com/lhxn/Konyac
