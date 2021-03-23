# 課題2: Ansibleでファイルを配布する

copyモジュールを使ったPlaybookを作る。

## 1. Playbookの作成

`playbook_kadai-2.yaml`に以下をコピペ

```yaml
- hosts: all
  roles:
    - kadai-2
```{{copy}}

## 2. ターゲットサーバへ配置するファイルの作成

`roles/kadai-2/files/copy_file`に以下をコピペ

```text
ターゲットサーバに配置されるファイルです。
Ansible実行後にターゲットサーバに配置されていることを確認してください。
```{{copy}}

## 3. タスクの作成

`roles/kadai-2/tasks/copy.yaml`に以下をコピペ

```yaml
- name: copy file
  copy:
    src: ./files/copy_file
    dest: /tmp/copy_file
```{{copy}}


`roles/kadai-2/tasks/main.yaml`に以下をコピペ

```yaml
- include: copy.yaml
```{{copy}}

## 4. Playbookを実行

`ansible-playbook -i inventory playbook_kadai-2.yaml`{{execute}}

## 5. 配置したファイルの確認

各ターゲットサーバへSSH接続し、`/tmp`ディレクトリに`copy_file`というファイルが配置されていることを確認します。  
以下のコマンドを1つ1つ実行していってください。

### 1号機

`ssh target01 -i /root/.ssh/test_key`{{execute}}  
`ls /tmp`{{execute}}  
`cat /tmp/copy_file`{{execute}}  
`exit`{{execute}}

### 2号機

`ssh target02 -i /root/.ssh/test_key`{{execute}}  
`ls /tmp`{{execute}}  
`cat /tmp/copy_file`{{execute}}  
`exit`{{execute}}
