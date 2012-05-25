## Requirements

* Command-T requires a Vim compiled with Ruby support (after installation,

```bash
rvm use system
cd bundle/command-t/ruby && ruby extconf.rb && make
```

).
* Exuberant ctags for tagbar support (or you can try installing [my fork of
  jsctags](https://github.com/othiym23/doctorjs), which works reasonably well
  with Node.js 0.6.x and tagbar).
* lushtags for Haskell support: `cabal install lushtags`.

## Setup

`./install.sh`
