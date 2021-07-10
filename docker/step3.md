# Pythonコンテナ

Python実行環境をコンテナで起動し、コンテナの使い方を体験します。  
ここでは以下の内容を学びます。

* コンテナ内部でのコマンド実行方法
* ボリュームマウント
* コンテナへの環境変数設定
* コンテナをまとめてすべて削除する

## Pythonコンテナを起動する

```bash
docker container run -dt --name python_test_01 python
```{{execute}}

## Pythonコンテナ内でPythonを実行する1

Pythonコンテナ内のbashを実行し、コンテナの中に入った状態になります。  
なお、イメージによってはbashがインストールされていない場合もあるため、その場合は`bash`の代わりに`sh`などを実行します。

```bash
docker container exec -it python_test_01 bash
```{{execute}}

Pythonコンテナ内のbashが実行された状態になるため、Pythonインタラクティブシェルを実行します。

```bash
python --version
python
```{{execute}}

Pythonインタラクティブシェルが起動したら適当なスクリプトを実行してみる。

```bash
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
docker container exec -it --name python_test_01 python
```{{execute}}

`exit`コマンドでPythonインタラクティブシェルを終了します。

```bash
exit()
```{{execute}}

## Pythonコンテナにスクリプトをマウントして起動する

```bash
docker container run -dt -v $(pwd)/python_script:/foo --name python_test_02 python
```{{execute}}

ファイルが置かれていることを確認するため、コンテナ内のbashを実行する。

```bash
docker container exec -it python_test_02 bash
```{{execute}}

コンテナの中でファイルを確認して実行する。

```bash
ls /foo
cat /foo/test.py
python /foo/test.py
```{{execute}}

`exit`コマンドでローカルのコンソールに戻ります。

```bash
exit
```{{execute}}

## コンテナ起動時に環境変数を設定する

```bash
docker container run -dt -e LANG=ja_JP.UTF8 -v $(pwd)/python_script:/foo  --name python_test_03 python
```{{execute}}

```bash
docker container exec -it python_test_03 bash
```{{execute}}

コンテナの中でファイルを確認して実行する。

```bash
echo ${LANG}
ls /foo
cat /foo/test.py
python /foo/test.py
```{{execute}}
