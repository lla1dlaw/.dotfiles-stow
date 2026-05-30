# wsl setup
export MESA_LOADER_DRIVER_OVERRIDE="d3d12"
export __GLX_VENDOR_LIBRARY_NAME="mesa"

# ================ General Exports ================
export PICO_SDK_PATH="$HOME/pico-sdk"
export TERM="xterm-256color"
export EDITOR=$(which nvim 2>/dev/null || which vim 2>/dev/null || which nano 2>/dev/null)
export VISUAL="$EDITOR"
export SUDO_EDITOR="$EDITOR"
export CUDA_ROOT="/usr/local/cuda"
export CUDA_HOME="/usr/local/cuda"
export LIBVIRT_DEFAULT_URI="qemu:///system"
export WINAPPS_SRC_DIR="$HOME/.local/bin/winapps-src"
export HOMEBREW_NO_ENV_HINTS=1
export MANPAGER="nvim +Man!"
export GOPATH="$HOME/go"
export NVM_DIR="$HOME/.nvm"
export PNPM_HOME="$HOME/.local/share/pnpm"
export LD_LIBRARY_PATH="${CUDA_ROOT}/lib64:${LD_LIBRARY_PATH}"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ================ PATH Configuration ================
# 'typeset -U' ensures all path entries are unique (no duplicates)
typeset -U path

path=(
  # 1. High Priority (Overrides system/brew binaries)
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "$HOME/.opencode/bin"
  "$HOME/.local/share/bob/nvim-bin"

  # 2. Package Managers & Runtimes
  "/home/linuxbrew/.linuxbrew/bin"
  "/home/linuxbrew/.linuxbrew/sbin"
  "/home/linuxbrew/.linuxbrew/opt/zig@0.14/bin"
  "$HOME/miniforge3/bin"
  "$HOME/miniconda3/condabin"
  "$HOME/.nvm/versions/node/v24.2.0/bin"
  "$PNPM_HOME"

  # 3. Specific Tool Binaries
  "${CUDA_ROOT}/bin"
  "$HOME/.local/share/cmvm/current/bin"
  "$HOME/.local/share/minisign-linux/x86_64"
  "$HOME/.local/share/minisign-linux"
  "/opt/nvim-linux-x86_64/bin"

  # 4. Existing System Paths (usr/bin, etc.)
  $path
)
export PATH
