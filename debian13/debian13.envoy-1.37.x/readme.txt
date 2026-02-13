$ brew install bazelisk cmake ninja git python
$ git clone https://github.com/envoyproxy/envoy.git
$ git checkout v1.37.0

cd envoy

$ export BAZEL_JAVAC_OPTS="-J-Xmx8g"

$ bazel build //source/exe:envoy-static \
  --define wasm=enabled \
  --define wasm_v8=enabled \
  --config=macos

🚀 六、编译完成后运行
> 生成的 binary：
$ bazel-bin/source/exe/envoy-static

> 验证 wasm：
$ ./bazel-bin/source/exe/envoy-static --version


git clone https://github.com/envoyproxy/envoy.git
cd envoy

$ 用 Docker build（最省事）：
docker run --rm -it \
  -v $(pwd):/source \
  envoyproxy/envoy-build:latest \
  bazel build //source/exe:envoy-static \
    --define wasm=enabled \
    --define wasm_v8=enabled
