# 課題3: テンプレートを利用してファイルを配布する

templateモジュールを使ったPlaybookを作る。

## 1. Playbookの作成

`playbook_kadai-3.yaml`に以下をコピペ

```yaml
- hosts: all
  roles:
    - kadai-3
```{{copy}}

## 2. ターゲットサーバへ配置するファイルの作成

`roles/kadai-2/templates/template_file.j2`に以下をコピペ

```yaml
ターゲットサーバに配置されるファイルです。
このサーバのホスト名は「{{ tbd }}」です。
Ansible実行後にターゲットサーバに配置されていることを確認してください。
```

## 3. タスクの作成

`roles/kadai-3/tasks/template.yaml`に以下をコピペ

```yaml
- name: template file
  template:
    src: ./templates/template_file.j2
    dest: /tmp
```{{copy}}


`roles/kadai-3/tasks/main.yaml`に以下をコピペ

```yaml
- include: template.yaml
```{{copy}}

## 4. Playbookを実行

`ansible-playbook -i inventory playbook_kadai-3.yaml`{{execute}}

## 5. 配置したファイルの確認

各ターゲットサーバへSSH接続し、`/tmp`ディレクトリに`template_file`というファイルが配置されていることを確認します。  
また、ファイルの中身が各サーバごとに異なっていることも確認します。  
以下のコマンドを1つ1つ実行していってください。

### 1号機

`ssh target01 -i /root/.ssh/test_key`{{execute}}  
`ls /tmp`{{execute}}  
`cat /tmp/template_file`{{execute}}  
`hostname`{{execute}}  
`exit`{{execute}}

### 2号機

`ssh target02 -i /root/.ssh/test_key`{{execute}}  
`ls /tmp`{{execute}}  
`cat /tmp/template_file`{{execute}}  
`hostname`{{execute}}  
`exit`{{execute}}
