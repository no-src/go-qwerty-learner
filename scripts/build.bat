@echo off

git submodule update --init --remote
pushd qwerty-learner
call yarn install
call yarn run build
popd
xcopy qwerty-learner\build webdist\build /E /Y /I
go build

echo.
echo "go-qwerty-learner build success"