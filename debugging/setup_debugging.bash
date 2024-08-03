#!/bin/bash
# Copied from: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#javascript-firefox
git clone https://github.com/firefox-devtools/vscode-firefox-debug.git ./debugging/repos/vscode-firefox-debug
cd ./debugging/repos/vscode-firefox-debug
npm install
npm run build
cd -

