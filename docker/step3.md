# Pythonコンテナ

Python実行環境をコンテナで起動し、コンテナの使い方を体験します。  
ここでは以下の内容を学びます。

* コンテナ内部でのコマンド実行方法
* ボリュームマウント
* コンテナへの環境変数設定

## Pythonコンテナを起動する

```bash
docker container run python
```{{execute}}

## Pythonコンテナ内でPythonを実行する1

Pythonコンテナ内のbashを実行し、コンテナの中に入った状態になります。  
なお、イメージによってはbashがインストールされていない場合もあるため、その場合は`bash`の代わりに`sh`などを実行します。

```bash
# PythonコンテナのIDを確認
docker container ls
```{{execute}}

```bash
# コンテナ内のbashを実行
docker exec -it <PythonコンテナID> bash
```{{copy}}

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

`exit`コマンドでローカルのコンソールに戻ります。

```bash
exit
```{{execute}}

## Pythonコンテナ内でPythonを実行する2

bashを経由せずに`docker exec`で直接Pythonインタラクティブシェルを起動することもできます。

```bash
# PythonコンテナのIDを確認
docker container ls
```{{execute}}

```bash
# コンテナ内のPythonインタラクティブシェルを実行
docker exec -it <PythonコンテナID> python
```{{copy}}

`exit`コマンドでローカルのコンソールに戻ります。

```bash
exit
```{{execute}}

## Pythonコンテナにスクリプトをマウントして起動する

```bash
docker run -v $(pwd)/python_script:/foo python
```{{execute}}

ファイルが置かれていることを確認するため、コンテナ内のbashを実行する。

```bash
# PythonコンテナのIDを確認
docker container ls
```{{execute}}

```bash
# コンテナ内のbashを実行
docker exec -it <PythonコンテナID> bash
```{{copy}}

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
docker run -e LANG=ja_JP.UTF8 -v $(pwd)/python_script:/foo python
```{{execute}}

```bash
# PythonコンテナのIDを確認
docker container ls
```{{execute}}

```bash
# コンテナ内のbashを実行
docker exec -it <PythonコンテナID> bash
```{{copy}}

コンテナの中でファイルを確認して実行する。

```bash
echo ${LANG}
ls /foo
cat /foo/test.py
python /foo/test.py
```{{execute}}
