# 課題5: 条件分岐を使う

whenを使って特定の場合にだけfetchを実行するPlaybookを作る。

## Playbookの作成

`playbook_kadai-5.yaml`に以下をコピペ

```yaml
- hosts: all
  roles:
    - kadai-5

```{{copy}}

## タスクの作成

1. `roles/kadai-5/tasks/hoge.yaml`に以下をコピペ

```yaml

```{{copy}}


2. `roles/kadai-5/tasks/main.yaml`に以下をコピペ

```yaml
- include: hoge.yaml

```{{copy}}

## Playbookを実行

`ansible-playbook -i inventory playbook_kadai-5.yaml`{{execute}}
