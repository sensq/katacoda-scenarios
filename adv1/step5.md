# 課題3: テンプレートを利用してファイルを配布する

templateモジュールを使ったPlaybookを作る。

## Playbookの作成

`playbook_kadai-3.yaml`に以下をコピペ

```yaml
- hosts: all
  roles:
    - kadai-3

```{{copy}}

## タスクの作成

1. `roles/kadai-3/tasks/hoge.yaml`に以下をコピペ

```yaml

```{{copy}}


2. `roles/kadai-3/tasks/main.yaml`に以下をコピペ

```yaml
- include: hoge.yaml

```{{copy}}

## Playbookを実行

`ansible-playbook -i inventory playbook_kadai-3.yaml`{{execute}}
