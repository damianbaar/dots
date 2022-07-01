{{ if eq .chezmoi.os "linux" -}}
#!/bin/sh
sudo apt install ripgrep

{{ else if eq .chezmoi.os "darwin" -}}

#!/bin/sh
brew install ripgrep
{{ end -}}

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

