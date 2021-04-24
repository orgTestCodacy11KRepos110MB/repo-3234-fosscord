echo --------------------------------------
echo Discord Open Source Contribution Setup
echo strg+c/strg+d to exit
echo -------------------------------------------
echo This will clone and setup all repositories,
echo if you only want to work on one specific repository
echo follow their specific Getting Started Guide and exit this script
echo ----------------------------------------------------------------
echo "Are you sure you want to continue (y/n)?"
read -p "" CONT
if [ "$CONT" != "y" ]; then
  echo Aborting setup
  exit 1
fi
echo ---------------------
echo Checking dependencies
if ! [ -x "$(command -v git)" ]; then
  echo Error: git is not installed.
  echo Please Install git from: https://git-scm.com/downloads
  echo And make sure its in the path
  exit 1
fi
if ! [ -x "$(command -v node)" ]; then
  echo Error: node is not installed.
  echo Please Install NodeJS from: https://nodejs.org/en/download/
  echo And make sure its in the path
  exit 1
fi
if ! [ -x "$(command -v npm)" ]; then
  echo 'Error: npm is not installed.' >&2
  echo Please install npm from: https://nodejs.org/en/download/
  echo And make sure its in the path
  exit 1
fi
echo ✓ Dependencies are already Installed
echo -------------------------------
echo Creating organization directory
mkdir fosscord
cd fosscord
echo Cloning all repositories

git clone https://github.com/fosscord/fosscord overview
git clone https://github.com/fosscord/fosscord-api api
git clone https://github.com/fosscord/fosscord-gateway gateway
git clone https://github.com/fosscord/fosscord-themes themes
git clone https://github.com/fosscord/fosscord-plugins plugins
git clone https://github.com/fosscord/fosscord-gateway gateway
git clone https://github.com/fosscord/fosscord-media media
git clone https://github.com/fosscord/fosscord-server-util server-util
git clone https://github.com/fosscord/fosscord-cdn cdn
git clone https://github.com/fosscord/fosscord-ui ui
git clone https://github.com/fosscord/fosscord-client client
git clone https://github.com/fosscord/fosscord-dashboard dashboard
git clone https://github.com/fosscord/fosscord-support support
git clone https://github.com/fosscord/fosscord-landingpage landingpage
git clone https://github.com/fosscord/css-mediaquery css-mediaquery
git clone https://github.com/fosscord/react-native-withcss react-native-withcss

echo '{"folders":[{"path":"overview"},{"path":"cdn"},{"path":"api"},{"path":"gateway"},{"path":"media"},{"path":"server-util"},{"path":"ui"},{"path":"client"},{"path":"plugins"},{"path":"themes"},{"path":"landingpage"},{"path":"dashboard"},{"path":"support"},{"path":"css-mediaquery"},{"path":"react-native-withcss"}]}' >> fosscord.code-workspace

if [ -x "$(command -v code)" ]; then
  echo Open VSCode Workspace
  code fosscord.code-workspace
fi