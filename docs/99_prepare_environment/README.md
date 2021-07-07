# 演習環境の準備

## 環境の構築

* 最低限以下のインストールが必要
    * `docker`, `docker-compose`, `ansible`
* Dockerを起動し、自動起動を有効化する
* ターゲットサーバに対するSSH設定（ssh_config）を配置する
* 演習用の資材を配置する
* code-serverを起動し、自動起動を有効化する

環境構築スクリプト例

* [Amazon Linux 2の場合](../../alternative_environment/assets/os-setup.sh)

## AWSで大量に環境を構築する場合

1. インスタンスを作成する
    * OS設定は上記の「環境の構築」と同様に行う
2. 上記インスタンスからAMIを作成する
3. 演習環境インスタンスを配置するVPCを作成する
4. `alternative_environment/terraform`のTerraformを実行する
    * `main.tf`の`locals`ブロックの変数を適宜書き換える
    * 必要があれば、その他の部分も書き換える
    * `terraform apply`を実行する
