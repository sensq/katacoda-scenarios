# 課題6: モジュールに存在しない処理を実行する

エラーハンドリングとシェルスクリプト  
register, when, changed_whenあたりを使って特定の場合にだけfetchを実行するPlaybookを作る。

## Playbookの作成

`playbook_kadai-6.yaml`に以下をコピペ

```yaml
- hosts: all
  roles:
    - kadai-6

```{{copy}}

## タスクの作成

1. `roles/kadai-6/tasks/hoge.yaml`に以下をコピペ

```yaml

```{{copy}}


2. `roles/kadai-6/tasks/main.yaml`に以下をコピペ

```yaml
- include: hoge.yaml

```{{copy}}

## Playbookを実行

`ansible-playbook -i inventory playbook_kadai-6.yaml`{{execute}}
