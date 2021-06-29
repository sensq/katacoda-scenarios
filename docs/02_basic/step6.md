Start - [1](step1.md) - [2](step2.md) - [3](step3.md) - [4](step4.md) - [5](step5.md) - [**6**](step6.md) - [7](step7.md) - [8](step8.md) - [9](step9.md) - [10](step10.md) - End

# 課題3: テンプレートを利用してファイルを配布する

本課題では、変数の概念について学んでもらいます。  
題材として、templateモジュールを使ったPlaybookを作ります。

## 1. Playbookの作成

`playbook_kadai-3.yaml`に以下をコピペします。

```yaml
- hosts: all
  roles:
    - kadai-3
```

## 2. インベントリファイルに変数を定義

Ansibleでの変数定義の方法はいくつかあり、一般的にはhost_varsやgroup_varsといったものがよく使われます。  
ただし、今回は演習の進行の都合上、インベントリファイルに記載する方法で定義することにします。

⚠️  
この方法はシンプルではありますが、ターゲットサーバや変数が多くなるとインベントリファイルが肥大化して見通しが悪くなるデメリットがあります。  
実際にAnsibleを使う際はどのように変数定義を行って管理していくかなどのルールも決めておく必要があることを理解しておくとよいです。

カレントディレクトリ直下の`inventory`ファイルに以下をコピペします。

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
```

## 3. ターゲットサーバへ配置するファイルの作成

`roles/kadai-3/templates/template_file.j2`に以下をコピペします。

```text
ターゲットサーバに配置されるファイルです。
このサーバのホスト名は「{{ ansible_hostname }}」です。
このサーバは「{{ server_location }}」に設置されています。
Ansible実行後にターゲットサーバに配置されていることを確認してください。
```

## 4. タスクの作成

[Ansibleの公式ドキュメント](https://docs.ansible.com/ansible/latest/index.html)の[templateモジュール](https://docs.ansible.com/ansible/2.9_ja/modules/template_module.html)を参考に、`roles/kadai-3/tasks/main.yaml`へタスクを作成します。  
実装の要件は以下の通りです。

* `template`モジュールを使うこと
* 2で作成した`roles/kadai-3/templates/template_file.j2`をターゲットサーバの`/tmp/template_file`へ配置すること

回答例は次のページに記載していますが、どうしても上手くいかない場合にだけ参考にしてください。

## 5. Playbookを実行

`ansible-playbook -i inventory playbook_kadai-3.yaml`

## 6. 配置したファイルの確認

各ターゲットサーバへSSH接続し、`/tmp`ディレクトリに`template_file`というファイルが配置されていることを確認します。  
また、ファイルの中身が各サーバごとに異なっていることも確認します。  
以下のコマンドを1つ1つ実行していってください。

### 1号機

`ssh target01 -i /root/.ssh/test_key`  
`ls /tmp`  
`cat /tmp/template_file`  
`hostname`  
`exit`

### 2号機

`ssh target02 -i /root/.ssh/test_key`  
`ls /tmp`  
`cat /tmp/template_file`  
`hostname`  
`exit`

---

- [前のページに戻る](step5.md)
- [目次](README.md)
- [解説に進む](step6a.md)
