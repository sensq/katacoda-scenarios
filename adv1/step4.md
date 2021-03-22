# 課題2: Ansibleでファイルを配布する

copyモジュールを使ったPlaybookを作る。

## Playbookの作成

`playbook_kadai-2.yaml`に以下をコピペ

```yaml
- hosts: all
  roles:
    - kadai-2

```{{copy}}

## タスクの作成

`roles/kadai-2/tasks/hoge.yaml`に以下をコピペ

```yaml

```{{copy}}


`roles/kadai-2/tasks/main.yaml`に以下をコピペ

```yaml
- include: hoge.yaml

```{{copy}}

## Playbookを実行

`ansible-playbook -i inventory playbook_kadai-2.yaml`{{execute}}
