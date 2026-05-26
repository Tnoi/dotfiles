# 🔧 Dotfiles

## 🚀 Quick Start

### Automated Setup
Run the installation script to set up your entire macOS environment:

```bash
chmod +x install.sh
./install.sh
```
### Manual Setup Steps
After running the installation script, complete these manual steps:

1. **Raycast**: Import your custom Raycast configuration
2. **Visual Studio Code**: Install extensions and sync settings
3. **Bitwarden**: Set up SSH agent integration

## 📁 Directory Structure

```
.
├── ghostty/
│   └── .config/ghostty/
├── home/
│   ├── .gitconfig
│   ├── .gitignore
│   ├── .hushlogin
│   ├── .stow-global-ignore
│   └── .zshenv
├── nvim/
│   └── .config/nvim/
│       ├── init.lua
│       ├── lua/
│       │   ├── config/ 
│       │   └── plugins/
│       └── lazy-lock.json
├── raycast/              
│   └── .config/raycast/
├── wallpapers/  
├── yazi/                 
│   └── .config/yazi
├── zsh/                  
│   └── .config/zsh     
├── install.sh            
└── README.md             
```

## ⚡ Tips & Tricks

- **Fast Navigation**: Use `zoxide` (z command) to jump to directories
- **Fuzzy Finder**: Press `Ctrl+R` to search command history

## 📝 License

This repository is provided as-is for personal use.

## 🤝 Contributing

This is a personal configuration repository, but feel free to fork and customize for your own setup!

---

**Happy coding!** 🚀
