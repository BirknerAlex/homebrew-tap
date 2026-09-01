# homebrew-tap

Personal Homebrew tap.

## Install

```
brew tap birkneralex/tap
brew install birkneralex/tap/silo
```

`brew install silo` on its own resolves to homebrew-core's unrelated `silo` formula, not this tap's — the fully qualified `tap/formula` form is required to disambiguate.

## Formulae

- [`silo`](Formula/silo.rb) — self-hosted package registry for RPM, Alpine APK, and npm ([source](https://github.com/BirknerAlex/silo))

## Auto-update

`.github/workflows/bump-formulae.yml` runs on a schedule (and can be triggered manually) and uses `brew bump-formula-pr`'s livecheck integration to open a PR whenever an upstream repo cuts a new release. `.github/workflows/tests.yml` audits and installs every formula on push/PR to catch breakage before merge.
