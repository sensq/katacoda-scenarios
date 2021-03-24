# 環境構築

## インストール

```bash
wget https://golang.org/dl/go1.16.2.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.2.linux-amd64.tar.gz
rm -rf go1.16.2.linux-amd64.tar.gz
```{{execute}}

## 環境変数の設定

```bash
export PATH=$PATH:/usr/local/go/bin
cat <<EOS >> ~/.profile
export PATH=$PATH:/usr/local/go/bin
EOS
```{{execute}}

## 動作確認

```bash
go version
```{{execute}}
