# Docker Compose

Dockerコマンドによる操作はコマンドのオプションが多く、今どのような状態でコンテナを作成しているのかがわかりにくいという欠点がありました。  
Docker Composeはそれらコンテナ起動設定をファイルとして管理し、シンプルな操作で毎回同じ環境を構築できるというツールになります。

## Docker Composeでコンテナを起動する

`compose_simple_test`ディレクトリで`docker-compose up -d`コマンドを実行します。  
これにより、同ディレクトリにある`docker-compose.yaml`ファイルが読み込まれ、NginxコンテナとPythonコンテナが作成されます。  
どのようにファイルを作成すればよいのかは実際にファイルの中身を確認ください。

```bash
cd compose_simple_test
docker-compose up -d
```{{execute}}

作成したコンテナの状態を確認します。

```bash
docker-compose ps
```{{execute}}

Pythonコンテナ内でスクリプトを実行します。

```bash
docker-compose exec python sh
```{{execute}}

```bash
ls /script
python /script/test.py
exit
```{{execute}}

以下のように直接コマンドを実行することも可能です。

```bash
docker-compose exec python python /script/test.py
```{{execute}}

コンテナを削除します。

```bash
docker-compose down
```{{execute}}

元のディレクトリに戻ります。

```bash
cd ~/works
```{{execute}}

## 同一ネットワークにコンテナを起動する

Docker Composeは基本的に1つの`docker-compose.yaml`ファイルに定義されているコンテナをすべて同一のネットワークに作成します。  
同一ネットワーク内のコンテナはコンテナ同士で互いに通信が可能です。  
この際、通信対象はコンテナのIPではなく「コンテナ名」で指定します。  
`compose_same_network_test`ディレクトリで`docker-compose up -d`コマンドを実行してください。  

```bash
cd compose_same_network_test
docker-compose up -d
```{{execute}}

作成したコンテナの状態を確認します。

```bash
docker-compose ps
```{{execute}}

Python02コンテナからPython01コンテナへPingを実行し、疎通が取れることを確認します。

```bash
docker-compose exec python_02 ping python_01 -c 4
```{{execute}}

なお、1つ1つのコンテナも固有のIPを持っており、それを直に指定しても通信は可能です。以下のコマンドでコンテナのIPを確認してみてください。

```bash
docker-compose exec python_01 ip a
```{{execute}}

```bash
docker-compose exec python_02 ip a
```{{execute}}

IPではなくコンテナ名で通信できる理由は、DockerがコンテナのIPをコンテナ名で名前解決できるようにしているためです。  
コンテナのIPは起動するたびに変化してしまいますが、コンテナ名で指定可能なことで常に同じ記述でコンテナ間の通信が可能になります。  
動作確認が終わったらコンテナを削除します。

```bash
docker-compose down
```{{execute}}

元のディレクトリに戻ります。

```bash
cd ~/works
```{{execute}}

## 異なるネットワークにコンテナを起動する

Docker Composeは、基本的に`docker-compose.yaml`が配置されているディレクトリの名前でネットワークを作成し、そのネットワーク内にコンテナを作成します。  
そのため、異なる名前のディレクトリで起動したコンテナは別ネットワークに作成され、コンテナ間は論理的に接続されていない状態になり、コンテナ間の通信は行えなくなります。  
`compose_same_network_test/docker-compose.yaml`に定義していたコンテナを2ファイルに分離したファイルを`compose_other_network_test`配下の`a_network`と`b_network`ディレクトリ内に配置してあるため、
2つとも起動して互いに通信不可であることを確認してください。

```bash
cd compose_other_network_test
cd a_network
docker-compose up -d
cd ../b_network
docker-compose up -d
```{{execute}}

Python02コンテナからPython01コンテナへPingを実行し、疎通が取れないことを確認します。

```bash
docker-compose exec python_02 ping python_01 -c 4
```{{execute}}

IPを確認し、2つのコンテナが異なるネットワークに存在していることを確認します。

```bash
cd ../
cd a_network
docker-compose exec python_01 ip a
```{{execute}}

```bash
cd ../b_network
docker-compose exec python_02 ip a
```{{execute}}

コンテナを削除します。

```bash
docker-compose down
```{{execute}}

元のディレクトリに戻ります。

```bash
cd ~/works
```{{execute}}

## envファイルにパラメータを外出しする

```bash
cd compose_env_test
docker-compose --env-file env_file up -d
```{{execute}}

※備考  
通常、envファイルは`.env`というファイル名で作成します。  
この場合、`--env-file`オプションを指定せずとも自動的に`.env`ファイルを読み込んでくれます。  
ただし、Katacoda環境では`.`から始まるファイルの配置が上手くいかなかったため、やむを得ず以下のようなコマンドで実行するようにしています。

スクリプトを実行し、環境変数が書き換わっていることを確認します。

```bash
docker-compose exec python python /script/test.py
```{{execute}}

なお、起動後にenvファイルを書き換えてもリアルタイムにコンテナへ反映はされません。  
変更を反映したい場合は再度コンテナを起動する必要があるため、以下のコマンドを実行して変更が反映されたことを確認してください。

```bash
sed -i -e s/LANG=.*/LANG=C/ env_file 
docker-compose --env-file env_file up -d
docker-compose exec python python /script/test.py
```{{execute}}

コンテナを削除します。

```bash
docker-compose down
```{{execute}}

元のディレクトリに戻ります。

```bash
cd ~/works
```{{execute}}
