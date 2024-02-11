set VERSION=%1

cd %HOMEPATH%

git config --global user.name "Node Builder"
git config --global user.email "node@localhost"
git config --global core.autocrlf false
git config --global core.filemode false
git config --global color.ui true

mkdir node
cd node

git clone --depth 1 --branch v%VERSION% https://github.com/nodejs/node
cd node

choco install boxstarter
powershell "Install-BoxstarterPackage https://raw.githubusercontent.com/nodejs/node/HEAD/tools/bootstrap/windows_boxstarter -DisableReboots"
vcbuild dll

cd out/Release
7z a %HOMEPATH%\node\node.zip -r *
