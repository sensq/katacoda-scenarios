# 課題4: ループを使う

本課題では、ループを行って複数の似たような処理を行うPlaybookの作り方を学んでもらいます。  
題材として、fetchモジュールを使って複数ファイルを取得するPlaybookを作ります。

## 1. Playbookの作成

`playbook_kadai-4.yaml`{{open}}に以下をコピペします。

```yaml
- hosts: all
  roles:
    - kadai-4
```{{copy}}

## 2. インベントリファイルに変数を定義

`works`ディレクトリ直下の`inventory`{{open}}ファイルに以下をコピペします。

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

⚠️：配列とマップについて  
上記ファイルの8-9行目と15-17行目の値には変数名を付けておらず、代わりにハイフンのみを記載している。  
これは一般的なプログラミング言語でも頻繁に使われる「配列」と呼ばれるデータ型であり、なんらかの共通の意味を持った複数の値をまとめて扱いたい場合などに利用されることが多い。  
一方で、その他の値は「マップ」と呼ばれるKey-Value形式のデータ型で定義されている（ハッシュ、連想配列などとも言われる）  
マップは構造を持ったデータ型であり、多くのデータをわかりやすくて参照しやすい表現方法で定義できるというメリットがある。  
また、配列とマップは複合的に定義することが可能であるため、上記のようにマップの中に配列を定義することも、マップを配列で複数定義することも可能である。  
例えば上記ファイルの16行目は`all.hosts.target02.fetch_files[1]`のように指定すれば`/etc/profile`という値を参照することができる。

## 3. タスクの作成

[Ansibleの公式ドキュメント](https://docs.ansible.com/ansible/latest/index.html)の[fetchモジュール](https://docs.ansible.com/ansible/2.9_ja/modules/fetch_module.html)と[ループ](https://docs.ansible.com/ansible/2.9_ja/user_guide/playbooks_loops.html)を参考に、`roles/kadai-4/tasks/loop.yaml`{{open}}へタスクを作成します。  
実装の要件は以下の通りです。

* `fetch`モジュールを使うこと
* `fetch_files`変数に定義したパスのファイルをループを使ってすべて取得すること
* 取得したファイルは`works`ディレクトリ直下の`kadai-4_fetch_files`というディレクトリに配置すること
* `roles/kadai-4/tasks/main.yaml`{{open}}に`loop.yaml`を読み込む記述を行うこと

回答例は次のページに記載していますが、どうしても上手くいかない場合にだけ参考にしてください。

## 4. Playbookを実行

`ansible-playbook -i inventory playbook_kadai-4.yaml`{{execute}}

## 5. 取得したファイルの確認

Playbookを実行すると、`works`ディレクトリ直下に`kadai-4_fetch_files`というディレクトリが表示されます。  
その中に各ターゲットサーバごとの変数に記載したパスのファイルが取得されているのを確認してください。  

※ディレクトリが表示されない場合は、エディタ上の以下の位置にある更新ボタンを押してください。

![](https://raw.githubusercontent.com/sensq/katacoda-scenarios/main/adv1/img/refresh.png)
