# Pythonコンテナ

Python実行環境をコンテナで起動し、コンテナの使い方を体験します。  
ここでは以下の内容を学びます。

* コンテナ内部でのコマンド実行方法
* ボリュームマウント
* コンテナへの環境変数設定
* コンテナをまとめてすべて削除する

## Pythonコンテナを起動する

```bash
docker container run -dt --name python_test_01 python:alpine
```{{execute}}

Pythonのイメージは800MB以上あり、Pullで多少の時間がかかります。  
一方で、Alpine版のPythonは45MB程度しかないため、非常に高速にPullが完了します。  
Alpineについては後ほど説明しますが、ここではとくに何も考えずにAlpine版を指定してください。  
※`-t`オプションについてもここでは詳細を割愛します。

## Pythonコンテナ内でPythonを実行する1

Pythonコンテナ内のbashを実行し、コンテナの中に入った状態になります。  
なお、イメージによってはbashがインストールされていない場合もあり、その場合は`bash`の代わりに`sh`などを実行します。  
今回しているAlpine版のPythonイメージには`bash`がインストールされていないため、`sh`を実行します。
※`-i`と`-t`オプションについてはここでは詳細を割愛します。

```bash
docker container exec -it python_test_01 sh
```{{execute}}

Pythonコンテナ内のbashが実行された状態になるため、Pythonインタラクティブシェルを実行します。

```bash
python --version
python
```{{execute}}

Pythonインタラクティブシェルが起動したら適当なスクリプトを実行してみます。

```python
foo = 3
print(foo * 10)
```{{execute}}

`exit`コマンドでPythonインタラクティブシェルを終了します。

```bash
exit()
```{{execute}}

`exit`コマンドでローカルのコンソールに戻ります。

```bash
exit
```{{execute}}

## Pythonコンテナ内でPythonを実行する2

bashを経由せずに`docker container exec`で直接Pythonインタラクティブシェルを起動することもできます。

```bash
docker container exec -it python_test_01 python
```{{execute}}

Pythonインタラクティブシェルが起動したら適当なスクリプトを実行してみます。

```python
foo = 3
print(f"fooの値は{foo}です。")
```{{execute}}

実行を確認できたら`exit`コマンドでPythonインタラクティブシェルを終了します。

```bash
exit()
```{{execute}}

## Pythonコンテナにスクリプトをマウントして起動する

ホームディレクトリに`works/python_script`というディレクトリを配置してあり、この中にPythonのスクリプトファイルが入っています。  
`-v`オプションを付与し、このディレクトリをコンテナにマウントして起動します。  
ただし、`-v`で指定するディレクトリのパスは必ず絶対パスでなければなりません。  
カレントディレクトリから相対パスで指定する場合は`pwd`コマンドを利用すると便利です。

```bash
docker container run -dt -v $(pwd)/python_script:/foo --name python_test_02 python:alpine
```{{execute}}

ファイルが置かれていることを確認するため、コンテナ内のbashを実行します。

```bash
docker container exec -it python_test_02 sh
```{{execute}}

コンテナの中でファイルを確認して実行します。

```bash
ls /foo
cat /foo/test.py
python /foo/test.py
```{{execute}}

このスクリプトはコンテナ内の言語設定（`LANG`環境変数）を出力するだけの内容になっています。  
正常に実行されると`C.UTF-8`と出力されます。  
実行を確認できたら`exit`コマンドでローカルのコンソールに戻ります。

```bash
exit
```{{execute}}

## マウントしているファイルを編集する

マウントしているファイルはホストとコンテナで共有されているため、どちらかの内容を書き換えればもう一方の内容も書き換わることを確認します。  
ホスト側で`python_script/test.py`に以下のコードを追記してください。

```python
print("ファイルを書き換えました。")
```

書き換えたファイルを実行して、実際に書き換わっていることを確認します。

```bash
docker container exec -it python_test_02 sh
```{{execute}}

```bash
ls /foo
cat /foo/test.py
python /foo/test.py
```{{execute}}

実行を確認できたら`exit`コマンドでローカルのコンソールに戻ります。

```bash
exit
```{{execute}}

## コンテナ起動時に環境変数を設定する

配置しているファイルは`LANG`という環境変数の値を出力しているPythonのスクリプトになっています。  
コンテナ起動時に`LANG`環境変数を設定し、実際にコンテナ内で環境変数が設定されていることを確認します。

```bash
docker container run -dt -e LANG=ja_JP.UTF8 -v $(pwd)/python_script:/foo  --name python_test_03 python:alpine
```{{execute}}

```bash
docker container exec -it python_test_03 sh
```{{execute}}

コンテナの中でファイルを確認して実行する。

```bash
echo ${LANG}
ls /foo
cat /foo/test.py
python /foo/test.py
```{{execute}}

`ja_JP.UTF8`と出力され、環境変数が書き換わっていることを確認できます。  
実行を確認できたら`exit`コマンドでローカルのコンソールに戻ります。

```bash
exit
```{{execute}}

なお、`exec`コマンドで直接スクリプトの実行も行えます。  
この場合`-i`と`-t`オプションは付けても付けなくてもよいです。

```bash
docker container exec python_test_03 python /foo/test.py
```{{execute}}

## コンテナをまとめてすべて削除する

ここまででコンテナを複数作成しましたが、すべてのコンテナを1つ1つ削除するのは手間がかかるため、まとめて削除します。  
`docker container ls -aq`ですべてのコンテナのコンテナIDのみを出力できることを利用します。

```bash
# 事前確認
docker container ls -a
```{{execute}}

```bash
# すべてのコンテナをまとめて削除
docker container rm -f $(docker container ls -aq)
```{{execute}}

```bash
# 事後確認
docker container ls -a
```{{execute}}

なお、すべてのコンテナを削除するコマンドには`docker container prune`というものもありますが、
こちらは停止状態のコンテナのみがすべて削除されるコマンドになります。
