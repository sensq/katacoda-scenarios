# Docker基本操作

Dockerを使うために必要な最低限の操作を学びます。

## コンテナを起動する

hello-worldイメージからコンテナを起動します。  
最初はhello-worldイメージがローカルに存在しないため、自動的に[Docker Hub](https://hub.docker.com/search?q=&type=image)からイメージがPullされます。  
なお、`docker pull`コマンドを使用することでコンテナを起動せずにイメージのPullだけを行うこともできます。

```bash
docker run hello-world
```{{execute}}

hello-worldイメージはコンソール上に文章を出力したら終了するだけのイメージなため、
`run`に成功すると、以下のような文章を出力して即座にコンテナが終了されます。

```text
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

## コンテナ情報を確認する

ローカルに現在存在しているコンテナの情報を見たい場合は`docker container ls`コマンドを使用します。  
通常停止状態のコンテナの情報は出力されませんが、`-a`オプションを付与することですべてのコンテナ情報を出力できます。  
hello-worldイメージのコンテナはすでに停止状態なため、今回は`-a`オプションを付与して実行しないと何も出力されません。

```bash
docker container ls -a
```{{execute}}

また、なんらかの自動化を行いたい場合はJSON形式で出力すると便利です。

```bash
docker container ls -a --format "{{json .}}"
```{{execute}}

`jq`コマンドを組み合わせるとヒューマンリーダブルな見た目で出力でき、特定の要素を抜き出すことも容易になります。

```bash
docker container ls -a --format "{{json .}}" | jq
```{{execute}}

```bash
# コンテナIDのみ出力
docker container ls -a --format "{{json .}}" | jq -r ".ID"
```{{execute}}

## イメージ情報を確認する

ローカルに現在存在しているイメージの情報を見たい場合は`docker image ls`コマンドを使用します。  
Katacoda環境ではデフォルトでいくつかのイメージが存在していますが、通常はこの時点ではhello-worldイメージのみが存在していることを確認できます。

```bash
docker image ls
```{{execute}}

また、イメージに関してもコンテナと同様にJSON形式で出力可能です。

```bash
docker image ls --format "{{json .}}" | jq
```{{execute}}

## コンテナを削除する

`docker container rm`コマンドを使用すると、停止しているコンテナを削除できます。  
削除したいコンテナはIDまたは名前で指定します。`docker container ls`で確認したものを指定してください。  
なお、IDの場合はユニークに特定できる部分までの文字列を指定すればよいです。コンテナが1つだけの場合は1文字でも削除できます。  
また、名前はコンテナを起動するたびにランダムで設定されますが、`run`コマンドに`--name`オプションを付与して実行すると任意の名前で起動することが可能です。

```bash
# コンテナのIDを確認
docker container ls -a
# コンテナ削除
docker container rm <コンテナのIDまたは名前>
```{{execute}}

:warning:  
現時点では停止中のコンテナしか存在していませんが、
稼働中のコンテナを削除したい場合は`docker container stop`コマンドで事前にコンテナを停止するか、`docker image rm`コマンドに`-f`オプションを付与して実行する必要があります。

## コンテナを終了したら自動的に削除されるように起動する

`run`コマンドにコンテナ起動時に`--rm`オプションを付与して実行すると、コンテナが終了したときに自動的に削除されるようになります。  
削除されないままゴミとしてリソースが残り続けてしまうことを防げます。

```bash
# 事前確認
docker container ls -a
# コンテナ起動
docker run --rm hello-world
# 終了状態のコンテナが存在してないことを確認
docker container ls -a
```{{execute}}

## イメージを削除する

`docker image rm`コマンドを使用すると、イメージを削除できます。`docker image ls`で確認したイメージIDを指定してください。  
コンテナの場合と同じく、IDはユニークに特定できる部分までの文字列を指定すればよいです。

```bash
# イメージのIDを確認
docker image ls
# イメージ削除
docker image rm <イメージのIDまたはリポジトリ名＋タグ>
```{{execute}}

また、以下のようにリポジトリ名とタグを指定して削除することも可能です。

```bash
docker image rm hello-world:latest
```{{execute}}
