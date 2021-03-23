# 課題5: 条件分岐を使う

whenを使って特定の場合にだけfetchを実行するPlaybookを作る。

## 1. Playbookの作成

`playbook_kadai-5.yaml`に以下をコピペ

```yaml
- hosts: all
  roles:
    - kadai-5
```{{copy}}

## 2. タスクの作成

`roles/kadai-5/tasks/when.yaml`に以下をコピペ

```yaml

```{{copy}}


`roles/kadai-5/tasks/main.yaml`に以下をコピペ

```yaml
- include: when.yaml
```{{copy}}

## 3. Playbookを実行

`ansible-playbook -i inventory playbook_kadai-5.yaml`{{execute}}
