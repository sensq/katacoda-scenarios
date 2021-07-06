# 演習環境の準備

## 環境の構築

* 以下をインストール
    * `git`, `docker`, `docker-compose`, `ansible`
* Docker設定と起動
* code-server設定と起動
* ターゲットサーバに対するSSH設定
* 資材の配置

Amazon Linux 2の場合のコマンドリスト（すべてrootユーザで実行することを想定）

```bash
# git, docker, docker-composeインストール
yum install -y git
yum install -y docker
curl -L https://github.com/docker/compose/releases/download/1.28.5/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
## docker-composeのコマンド補完設定
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose

# docker起動と自動起動設定
systemctl start docker
systemctl enable docker

# Ansibleインストール
amazon-linux-extras -y install epel
yum install -y ansible

# 資材の配置（見直し予定）
## 設定資材の配置
cd /
git clone https://github.com/sensq/katacoda-scenarios.git
cd /katacoda-scenarios/adv1/assets/
cp -r configs tools /  # Katacodaで構築している環境と同じディレクトリ構成にする
cp -fp /configs/ssh_config ~/.ssh/config
ssh-keygen -t rsa -N "" -f ~/.ssh/test_key
rm -f ~/.ssh/known_hosts
echo "PUBLIC_KEY=\"$(cat ~/.ssh/test_key.pub)\"" > /tools/.env
## 演習資材の配置
mkdir /training
cd /training
mkdir 01_introduction 02_basic 03_practice
mv /katacoda-scenarios/test/assets/works/* /training/01_introduction/
mv /katacoda-scenarios/adv1/assets/works/* /training/02_basic/
mv /katacoda-scenarios/practice/assets/works/* /training/03_practice/
rm -rf /katacoda-scenarios

# code-serverインストールと設定
curl -fsSL https://code-server.dev/install.sh | sh
systemctl start code-server@root
systemctl enable code-server@root
## 必要あれば設定を変更する
vi ~/.config/code-server/config.yaml
vi /root/.local/share/code-server/User/settings.json
systemctl restart code-server@root

# スクリプトの実行に必要（見直し予定）
touch /completed
```

## AWSで大量に環境を構築する場合

1. インスタンスを作成する
    * OS設定は上記の「環境の構築」と同様に行う
2. 上記インスタンスからAMIを作成する
3. 演習環境インスタンスを配置するVPCを作成する
4. `alternative_environment_terraform/terraform`のTerraformを実行する
    * `main.tf`の`locals`ブロックの変数を適宜書き換える
    * 必要があれば、その他の部分も書き換える
    * `terraform apply`を実行する
