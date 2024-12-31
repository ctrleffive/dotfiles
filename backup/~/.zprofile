export STORAGE_ROOT=/Volumes/External

if [ -d "$STORAGE_ROOT" ]; then
  export ANDROID_SDK_ROOT="$STORAGE_ROOT/Android/sdk"
  export PATH="$PATH:$ANDROID_SDK_ROOT/emulator"
  export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"
  export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin"
  export PATH="$PATH:$STORAGE_ROOT/Flutter/sdk/bin"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
  [ -s "./.nvmrc" ] && nvm use

export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby@3.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby@3.1/include"

if [ -f ".tempdirs" ]; then
    tempdirs
fi
