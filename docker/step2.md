# Nginxコンテナ

実用的なアプリケーションをコンテナで起動し、コンテナの使い方を体験します。  
ここでは実用的なアプリケーションとしてNginxを使用し、以下の内容を学びます。

* コンテナのバックグラウンド実行
* ホストとコンテナのポートマッピング
* コンテナのログの見方

## Nginxコンテナを起動する

まず、普通にNginxコンテナを起動してみます。

```bash
docker container run nginx
```{{execute}}

バックグラウンド実行とポートマッピング

```bash
docker container run --name nginx01 -d -p 8080:80 nginx
```{{execute}}

```bash
curl http://localhost:8080
```{{execute}}

## コンテナのログを確認する

```bash
docker container logs nginx01
```{{execute}}

再度curlでアクセスし、アクセスログが増えていることを確認する。

```bash
curl http://localhost:8080
```{{execute}}

```bash
docker container logs nginx01
```{{execute}}

## Nginxコンテナ削除

```bash
docker container rm -f nginx01
```{{execute}}
