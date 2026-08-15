# homebrew-tap

Personal Homebrew tap. Formulae for CLI tools live here; more can be added over time.

```bash
brew tap yutat23/tap
brew trust yutat23/tap
```

Homebrew 6 onwards requires [tap trust](https://docs.brew.sh/Tap-Trust) before loading formulae from a non-official tap. Trusting the whole tap is appropriate here: it covers current and future formulae in this repository. To trust only one formula instead:

```bash
brew trust --formula yutat23/tap/lsoff
```

## Formulae

| Formula | Description |
| --- | --- |
| [lsoff](https://github.com/yutat23/lsoff) | CLI/TUI for listing listening TCP/UDP ports |

```bash
brew install lsoff
```
