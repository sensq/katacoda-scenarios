# 課題3: テンプレートを利用してファイルを配布する

templateモジュールを使ったPlaybookを作る。

## 1. Playbookの作成

`playbook_kadai-3.yaml`に以下をコピペ

```yaml
- hosts: all
  roles:
    - kadai-3
```{{copy}}

## 2. インベントリファイルに変数を定義

`works`ディレクトリ直下の`inventory`ファイルに以下をコピペ

```yaml
all:
  hosts:
    target01:  # hostごとの変数
      ansible_port: 2222
      ansible_user: hoge
      server_location: 新宿
    target02:  # hostごとの変数
      ansible_port: 2223
      ansible_user: foo
      server_location: 豊洲
  vars:  # 共通の変数
    ansible_ssh_private_key_file: ~/.ssh/test_key
```{{copy}}

## 3. ターゲットサーバへ配置するファイルの作成

`roles/kadai-2/templates/template_file.j2`に以下をコピペ

```text
ターゲットサーバに配置されるファイルです。
このサーバのホスト名は「{{ ansible_hostname }}」です。
このサーバは「{{ server_location }}」に設置されています。
Ansible実行後にターゲットサーバに配置されていることを確認してください。
```{{copy}}

## 4. タスクの作成

`roles/kadai-3/tasks/template.yaml`に以下をコピペ

```yaml
- name: template file
  template:
    src: ./templates/template_file.j2
    dest: /tmp/template_file
```{{copy}}


`roles/kadai-3/tasks/main.yaml`に以下をコピペ

```yaml
- include: template.yaml
```{{copy}}

## 5. Playbookを実行

`ansible-playbook -i inventory playbook_kadai-3.yaml`{{execute}}

## 6. 配置したファイルの確認

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
