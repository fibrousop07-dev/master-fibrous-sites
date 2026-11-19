# master-fibrous-sites

A Claude Code skill that turns a plain-language business brief into a finished website. It researches real references, offers a few concepts and palettes, builds only the one you pick, sorts out the assets (generated, stock or your own), then polishes and tests the result.

## Install

Two steps.

```bash
git clone https://github.com/fibrousop07-dev/master-fibrous-sites.git
cd master-fibrous-sites
```

Then run the installer for your system:

```bash
./install.sh            # macOS, Linux, Git Bash
```
```powershell
.\install.ps1           # Windows PowerShell
```

The installer copies the skill into `~/.claude/skills` and then asks if you also want:

- [awesome-frontend-skills](https://github.com/fibrousop07-dev/awesome-frontend-skills) – GSAP, design polish, accessibility and the router skill
- [site-glow-up-skills](https://github.com/fibrousop07-dev/site-glow-up-skills) – the polish pass the skill can run at the end

Say no to both and you get just this skill. Pass `--all` (or `-All` on Windows) to accept everything without prompts.

Restart Claude Code and run `/master-fibrous-sites a short description of the business`.

## Notes

The build stage also uses `impeccable` and `animejs` if they're installed. Those belong to other authors, so grab them from their own repos.

## License

MIT
