# 課題4: ループを使う

fetchモジュールにwith_items使って複数ファイル取得するPlaybookを作る。

## 1. Playbookの作成

`playbook_kadai-4.yaml`に以下をコピペ

```yaml
- hosts: all
  roles:
    - kadai-4

```{{copy}}

## 2. タスクの作成

`roles/kadai-4/tasks/hoge.yaml`に以下をコピペ

```yaml

```{{copy}}


`roles/kadai-4/tasks/main.yaml`に以下をコピペ

```yaml
- include: hoge.yaml

```{{copy}}

## 3. Playbookを実行

`ansible-playbook -i inventory playbook_kadai-4.yaml`{{execute}}
