# 演習環境の準備

## 環境の構築

詳細はTBD

* 以下をインストール
    * `git`, `docker`, `docker-compose`, `ansible`, `jq`
* Docker設定と起動
* code-server設定と起動
* ターゲットサーバに対するSSH設定

## AWSで大量に環境を構築する場合

1. インスタンスを作成する
    * OS設定は上記の「環境の構築」と同様に行う
2. 上記インスタンスからAMIを作成する
3. 演習環境インスタンスを配置するVPCを作成する
4. `alternative_environment_terraform/terraform`のTerraformを実行する
    * `main.tf`の`locals`ブロックの変数を適宜書き換える
    * 必要があれば、その他の部分も書き換える
    * `terraform apply`を実行する
