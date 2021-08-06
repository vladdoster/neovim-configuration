git clone --recurse-submodules https://github.com/Koihik/LuaFormatter.git /tmp/luaformatter
pushd /tmp/luaformatter
cmake .
make
make =j4 install
popd -1
