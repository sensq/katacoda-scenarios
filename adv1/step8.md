# 課題6: モジュールに存在しない処理を実行する

エラーハンドリングとシェルスクリプト  
register, when, changed_whenあたりを使って特定の場合にだけfetchを実行するPlaybookを作る。

## 1. Playbookの作成

`playbook_kadai-6.yaml`に以下をコピペ

```yaml
- hosts: all
  roles:
    - kadai-6
```{{copy}}

## 2. タスクの作成

`roles/kadai-6/tasks/shell.yaml`に以下をコピペ

```yaml

```{{copy}}


`roles/kadai-6/tasks/main.yaml`に以下をコピペ

```yaml
- include: shell.yaml
```{{copy}}

## 3. Playbookを実行

`ansible-playbook -i inventory playbook_kadai-6.yaml`{{execute}}
