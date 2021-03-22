# 課題1: Ansibleでファイルを収集する

fetchモジュールを使ったPlaybookを作る。

## Playbookの作成

`playbook_kadai-1.yaml`に以下をコピペ

```yaml
- hosts: all
  roles:
    - kadai-1

```{{copy}}

## タスクの作成

1. `roles/kadai-1/tasks/fetch.yaml`に以下をコピペ

```yaml
- name: fetch 「/etc/passwd」
  fetch:
    src: /etc/passwd
    dest: ./kadai-1_fetch_files/

```{{copy}}


2. `roles/kadai-1/tasks/main.yaml`に以下をコピペ

```yaml
- include: fetch.yaml

```{{copy}}

## Playbookを実行

`ansible-playbook -i inventory playbook_kadai-1.yaml`{{execute}}
