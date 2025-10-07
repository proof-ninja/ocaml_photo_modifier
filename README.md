# OCaml Photo Modifier

## 使い方

Windows での使い方を前提としています。

### 前提条件

WSL が使える状態である必要があります。
WSL のインストールについては、以下のページを参照ください。

https://learn.microsoft.com/ja-jp/windows/wsl/install

### ファイルの準備

GitHub Actions の成果物として以下のような内容の zip ファイルがダウンロードできるので、取得する。

```
ocaml_photo_modifier/
  - main.exe
  - run.sh
  - run.bat
```

### 実行

zip ファイルを展開し、中の3つのファイルを処理したい画像ファイルと同じディレクトリに入れてください。
その後、 `run.bat` をダブルクリックします。
するとウィンドウが開いて処理が行われます。

## ビルド方法

### camlimages のビルド

このアプリケーションでは jpeg を扱うので、 camlimages をビルドする際に libjpeg が利用できる必要があります。

#### 1. libjpeg のインストール

**Ubuntu の場合**:

```bash
$ sudo apt install libjpeg-dev
```

#### 2. camlimages のソースを手元に持って来る

```
$ opam source camlimages.5.0.5

$ cd camlimages.5.0.5
```

#### 3. `config/ciconfig.ml` を修正する

`c_flags` に `"-fPIC"` を加える。

```ocaml
let jpeg = find_library
    [ by_pkg_config "libjpeg"
    ; by_cc ~c_flags:["-fPIC"] ~link_flags:["-ljpeg"] ~headers:["jpeglib.h"] ~functions:["jpeg_read_header"]
    ]
```

#### 4. camlimages をインストール

```
$ opam install .
```

### ocaml_photo_modifier のビルド

opam と ocaml と dune は既にインストールされているものとします。

#### 1. 依存するライブラリをインストール

```
$ cd ocaml_photo_modifier

$ opam install . --deps-only
```

#### 2. dune でビルド

```
$ dune build
```
