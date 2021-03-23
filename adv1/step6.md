# 課題4: ループを使う

fetchモジュールにwith_items使って複数ファイル取得するPlaybookを作る。

## 1. Playbookの作成

`playbook_kadai-4.yaml`に以下をコピペ

```yaml
- hosts: all
  roles:
    - kadai-4
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
      fetch_files:
        - /etc/passwd
        - /etc/ssh/sshd_config
    target02:  # hostごとの変数
      ansible_port: 2223
      ansible_user: foo
      server_location: 豊洲
      fetch_files:
        - /etc/group
        - /etc/profile
        - /proc/cpuinfo
  vars:  # 共通の変数
    ansible_ssh_private_key_file: ~/.ssh/test_key
```{{copy}}

## 3. タスクの作成

`roles/kadai-4/tasks/loop.yaml`に以下をコピペ

```yaml
- name: fetch files
  fetch:
    src: "{{ item }}"
    dest: ./kadai-4_fetch_files/
  loop: "{{ fetch_files }}"
```{{copy}}


`roles/kadai-4/tasks/main.yaml`に以下をコピペ

```yaml
- include: loop.yaml
```{{copy}}

## 4. Playbookを実行

`ansible-playbook -i inventory playbook_kadai-4.yaml`{{execute}}

## 5. 取得したファイルの確認

Playbookを実行すると、`works`ディレクトリ直下に`kadai-4_fetch_files`というディレクトリが表示されます。  
その中に各ターゲットサーバごとの変数に記載したパスのファイルが取得されているのを確認してください。  

※ディレクトリが表示されない場合は、エディタ上の以下の位置にある更新ボタンを押してください。

![](https://raw.githubusercontent.com/sensq/katacoda-scenarios/main/adv1/img/refresh.png)
