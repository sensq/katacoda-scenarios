# Nginxコンテナ

実用的なアプリケーションをコンテナで起動し、コンテナの使い方を体験します。  
ここでは実用的なアプリケーションとしてNginxを使用し、以下の内容を学びます。

* コンテナのバックグラウンド実行
* ホストとコンテナのポートマッピング
* コンテナのログの見方

## Nginxコンテナを起動する

まず、普通にNginxコンテナを起動してみます。

```bash
docker run nginx
```{{execute}}

バックグラウンド実行とポートマッピング

```bash
docker run -d -p 8080:80 nginx
```{{execute}}

```bash
curl http://localhost:8080
```{{execute}}

## コンテナのログを確認する

```bash
# NginxコンテナのIDを確認
docker container ls
# ログを出力
docker logs <NginxコンテナID>
```{{execute}}

## Nginxコンテナ削除

```bash
# NginxコンテナのIDを確認
docker container ls
# Nginxコンテナ削除
docker container rm -f <NginxコンテナID>
```{{execute}}
