# 🛠 My Dev Environment Files

## 🐚 Zsh
Create a symlink to the Zsh config file located in `.config` folder
```bash
ln ~/.config/zsh/.zshrc ~/.zshrc
```

## 📝 Neovim
Updating
## 🔧 Tmux
Updating
## ⚡ PowerShell
### Requirements
- [Oh My Posh](https://ohmyposh.dev/)

This setup uses a **custom theme**, but you can use any of the [available Oh My Posh themes](https://ohmyposh.dev/docs/themes).

**Option 1: Centralize Config in** `.config`
1. Create a folder named `PowerShell` inside your `Documents` directory.
```powershell
  mkdir ~/Documents/PowerShell
```
2. Create a file called `user_profile.ps1` inside the `PowerShell` folder.
3. In `user_profile.ps1`, load the actual configuration from the `.config` directory.
```powershell
  . $env:USERPROFILE\.config\powershell\user_profile.ps1
```
4. Restart PowerShell to apply changes.

**Option 2: Use Default PowerShell Config Path**
1. Create `PowerShell` folder inside `Documents`.
```powershell
  mkdir ~/Documents/PowerShell
```
2. Copy your configuration files (`user_profile.ps1` and `user.omp.toml`) into that folder.
```powershell
  cp path/to/user_profile.ps1 ~/Documents/PowerShell/
  cp path/to/user.omp.toml ~/Documnets/PowerShell
```
3. Restart PowerShell to apply the new configuration.