# ⚙️ Dotfiles

Welcome to my personal, cross-platform configuration archive. These dotfiles are meticulously designed to power a highly efficient, minimal, and secure workflow across **Linux (dwm/X11)** and **macOS** environments.

---

## 🚀 Key Features

*   **💻 Shell & Prompt:** Zsh powered by `powerlevel10k` and `starship` for a fast, informative, and context-aware prompt.
*   **✍️ Editor:** Optimized, lightweight **Neovim (nvim)** configuration for coding efficiency.
*   **🐚 Terminal Emulators:** Dual support for **Alacritty** and **Kitty** terminal emulators, configured for visual consistency and GPU performance.
*   **🔔 System Alerts:** Clean **Dunst** notification daemon setup for structured system messages.
*   **📦 Environment Utilities:** Auto-activation of Python virtual environments (`venv`/`.venv`) on directory entry.
*   **🛡️ Security First:** macOS Keychain integration to load API keys securely into memory without hardcoding secrets in configuration files.

---

## 📁 Repository Structure

```text
Dotfiles/
├── .config/                  # Tool-specific configurations
│   ├── alacritty/            # GPU-accelerated terminal config
│   ├── dunst/                # System notifications daemon config
│   ├── fontconfig/           # Custom font rendering settings
│   ├── gtk-3.0/              # GTK application themes
│   ├── kitty/                # Terminal emulator config
│   ├── nvim/                 # Neovim settings
│   └── redshift/             # Blue-light filter configs
├── .dwm/                     # Dynamic Window Manager config & autostart
├── .local/
│   └── bin/                  # Custom system & status-bar scripts
├── etc/                      # Global configurations (LightDM, locale, X11)
├── usr/                      # System assets (wallpapers and icons)
└── README.md
```

---

## 🔒 Security: Secret Management (macOS)

Instead of keeping sensitive API keys and tokens in `.zshrc` or environmental files that could accidentally be committed, this setup utilizes a secure helper function to pull credentials on-demand from the **macOS Keychain**:

1.  **Set a secret:**
    ```bash
    set_keychain_secret GEMINI_API_KEY
    ```
2.  **How it loads:**
    Whenever a new shell starts, `.zshrc` uses the Keychain API (`security find-generic-password`) to fetch the keys securely and load them directly into environment variables.

Supported keys out-of-the-box: `GEMINI_API_KEY`, `OPENAI_API_KEY`, `ANTHROPIC_API_KEY`, `DEEPSEEK_API_KEY`, `GROQ_API_KEY`, `TAVILY_API_KEY`, `EXA_API_KEY`, `PERPLEXITY_API_KEY`, `OPENROUTER_API_KEY`, `HUGGINGFACE_CO_API_TOKEN`, etc.

---

## 🛠️ Prerequisites & Installation

### Dependencies
Make sure you have the following installed on your system:
*   **Shell:** `zsh`, `fzf`, `starship`
*   **Terminal:** `alacritty` or `kitty`
*   **Editor:** `neovim`
*   **Fonts:** `JetBrains Mono`

### Installation & Linking
To link these configurations to your home directory, you can manually symlink the files or use GNU Stow:

```bash
# Example: Using GNU Stow to manage configs
stow .
```

*Note: For the `.local/bin` scripts to function on Linux, ensure system tools like `bluetoothctl` (for `dmenu-bluetooth`) and window manager helpers are installed.*

---

## 📄 License
This repository is open-sourced under the **MIT License**. See the [LICENSE](LICENSE) file for more information.
