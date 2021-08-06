git clone --recurse-submodules https://github.com/Koihik/LuaFormatter.git /tmp/luaformatter
pushd /tmp/luaformatter
mkdir build 
pushd build
cmake .. -DBUILD_TESTS=FALSE 
cmake --build . --target install 
popd -2
