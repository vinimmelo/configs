./install.sh
echo 'Initial installation finished!'

curl -sLf https://spacevim.org/install.sh | bash
echo 'SpaceVim installed'

cp init.toml ~/SpaceVim.d/
echo 'Initial config copied to SpaceVim.d'
