# コンテナイメージをビルドする

コンテナイメージを作成することを「ビルド」と言います。  
ここまでコンテナイメージはすべてPullしてきたものを使用していましたが、
独自のアプリケーションを動かしたい場合は動かすための設定やファイル配置などを行ったコンテナイメージを作成する必要が出てくる場合があります。  
ただし、独自のコンテナイメージを作成するとそのコンテナイメージの管理も自分たちで行わなくてはならないため、運用管理の観点からはデメリットになってしまうという面もあります。  
ここではコンテナイメージ作成についてのみ記載しますが、実用的に使いこなすためには他にも様々なノウハウが要求されます。

## Dockerでコンテナイメージをビルドする

Alpineイメージにbashを入れただけのコンテナイメージをビルドします。  
なお、ビルドしている内容は同ディレクトリに配置されている`Dockerfile`に定義されています。  
コンテナイメージのビルドとは、基本的に`Dockerfile`を作成してビルドコマンドを実行する操作のことになります。

```bash
cd build_image
docker image build . -t bash_alpine
```{{execute}}

コンテナイメージが作成されたことを確認します。  
`alpine`よりも若干サイズが大きい`bash_alpine`というイメージが作成されていることを確認できます。

```bash
docker image ls
```{{execute}}

## Docker Composeでコンテナイメージをビルドする

`docker-compose.yaml`にビルド定義を記述しておき、Docker Composeでビルドすることもできます。  
`build_image`ディレクトリに配置されている`docker-compose.yaml`の内容を確認し、以下コマンドを実行してください。

```bash
docker-compose build
```{{execute}}

また、Docker Composeではビルドと起動を同時に行うことも可能です。  
`build_image/docker-compose.yaml`には`image`のパラメータが無く、ビルド定義しか記述されていませんが、
この状態で`up`コマンドを実行するとビルドを行った後にそのイメージでコンテナが作成されます。  
また、すでにイメージがビルド済みで再ビルド不要な場合はビルド処理が省略されてコンテナが作成されます。

```bash
docker-compose up -d
```{{execute}}

実際にbashを実行可能なことを確認します。

```bash
docker-compose exec bash_alpine bash
```{{execute}}

実行できたら`exit`でコンテナを抜けます。

```bash
exit
```{{execute}}

なお、この際に作成されるイメージの名前は自動的に「ディレクトリ名＋サービス名」になります。  
任意の名前で固定したい場合は`image`のパラメータを併記すると、そのパラメータで指定された名前でイメージが作成されます。  
以下のように`build_image/docker-compose.yaml`を書き換えて再度イメージを作成してみてください。

```yaml
version: '3.0'
services:
  bash_alpine:
    build: .
    image: bash_alpine:test
    tty: true
    volumes:
      - ./python_script:/script
    environment:
      - LANG=ja_JP.UTF8
```{{copy}}

```bash
docker-compose build
```{{execute}}

```bash
docker image ls
```{{execute}}

イメージ名が`bash_alpine`でタグが`test`のコンテナイメージが作成されたことを確認できます。

## コンテナイメージビルドについての補足

`docker image ls`でイメージを確認すると、今回ビルドしたイメージはすべてイメージIDが同一になっていることを確認できます。  
これは名前（タグ）が異なるだけで中身は同じということを表しています。  
なお、この場合はイメージIDを指定してのイメージ削除などはエラーになります。  
「イメージ名＋タグ」で指定する方法でコマンドを実行してください。

```bash
# testタグのついたbash_alpineイメージを削除したい場合のコマンド例
docker image rm bash_alpine:test
```{{execute}}

```bash
# 削除されたことの確認
docker image ls
```{{execute}}

※注意  
詳細は割愛しますが、同じイメージIDのイメージが複数存在していても、ストレージ容量は1個分しか使われていません（多少の誤差はあると思います）  
これはイメージの実体がレイヤーの積み重ねであり、同じイメージIDのイメージが参照しているレイヤーは同じものであるという仕様からです。  
また、イメージIDの異なるイメージでも、差分を辿っていく過程でどこかからか同一のレイヤーを参照している場合もあります。  
そのため、ストレージの空きを増やすためにイメージを削除しても思ったより使用量が減らないことがあります。
