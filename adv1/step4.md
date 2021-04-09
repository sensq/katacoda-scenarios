# 課題2: Ansibleでファイルを配布する

copyモジュールを使ったPlaybookを作る。

## 1. Playbookの作成

`playbook_kadai-2.yaml`に以下をコピペ

```yaml
- hosts: all
  roles:
    - kadai-2
```{{copy}}

## 2. ターゲットサーバへ配置するファイルの作成

`roles/kadai-2/files/copy_file`に以下をコピペ

```text
ターゲットサーバに配置されるファイルです。
Ansible実行後にターゲットサーバに配置されていることを確認してください。
```{{copy}}

## 3. タスクの作成

[Ansibleの公式ドキュメント]の[copyモジュール]を参考に、`roles/kadai-2/tasks/copy.yaml`へタスクを作成する。  
実装の要件は以下の通り

* `copy`モジュールを使うこと
* 2で作成した`roles/kadai-2/files/copy_file`をターゲットサーバの`/tmp/copy_file`へ配置すること
* `roles/kadai-2/tasks/main.yaml`に`copy.yaml`を読み込む記述を行うこと

## 4. Playbookを実行

`ansible-playbook -i inventory playbook_kadai-2.yaml`{{execute}}

## 5. 配置したファイルの確認

各ターゲットサーバへSSH接続し、`/tmp`ディレクトリに`copy_file`というファイルが配置されていることを確認します。  
以下のコマンドを1つ1つ実行していってください。

### 1号機

`ssh target01 -i /root/.ssh/test_key`{{execute}}  
`ls /tmp`{{execute}}  
`cat /tmp/copy_file`{{execute}}  
`exit`{{execute}}

### 2号機

`ssh target02 -i /root/.ssh/test_key`{{execute}}  
`ls /tmp`{{execute}}  
`cat /tmp/copy_file`{{execute}}  
`exit`{{execute}}
