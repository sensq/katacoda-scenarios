Start - [1](step1.md) - [2](step2.md) - [3](step3.md) - [4](step4.md) - [5](step5.md) - [6](step6.md) - [7](step7.md) - [**8**](step8.md) - [9](step9.md) - [10](step10.md) - [11](step11.md) - [12](step12.md) - End


# 課題4: ループを使う

本課題では、ループを行って複数の似たような処理を行うPlaybookの作り方を学んでもらいます。  
題材として、fetchモジュールを使って複数ファイルを取得するPlaybookを作ります。

## 1. Playbookの作成

`playbook_kadai-4.yaml`に以下をコピペします。

```yaml
- hosts: all
  roles:
    - kadai-4
```

## 2. インベントリファイルに変数を定義

カレントディレクトリ直下の`inventory`ファイルに以下をコピペします。

```yaml
all:
  hosts:
    target01:  # hostごとの変数
      ansible_port: 2222
      ansible_user: hoge
      server_hostname: target-server-01
      fetch_files:
        - /etc/passwd
        - /etc/ssh/sshd_config
    target02:  # hostごとの変数
      ansible_port: 2223
      ansible_user: foo
      server_hostname: target-server-02
      fetch_files:
        - /etc/group
        - /etc/profile
        - /proc/cpuinfo
  vars:  # 共通の変数
    ansible_ssh_private_key_file: ~/.ssh/test_key
```

## 3. タスクの作成

「[fetchモジュールのドキュメント](https://docs.ansible.com/ansible/2.9_ja/modules/fetch_module.html)」と「[ループのドキュメント](https://docs.ansible.com/ansible/2.9_ja/user_guide/playbooks_loops.html)」を参考に、`roles/kadai-4/tasks/main.yaml`へタスクを作成します。  
実装の要件は以下の通りです。

* `fetch`モジュールを使うこと
* `fetch_files`変数に定義したパスのファイルをループを使ってすべて取得すること
* 取得したファイルはカレントディレクトリ直下の`kadai-4_fetch_files`というディレクトリに配置すること

回答例は次のページに記載していますが、どうしても上手くいかない場合にだけ参考にしてください。

## 4. Playbookを実行

```bash
ansible-playbook -i inventory playbook_kadai-4.yaml
```

## 5. 取得したファイルの確認

Playbookを実行すると、カレントディレクトリ直下に`kadai-4_fetch_files`というディレクトリが表示されます。  
その中に各ターゲットサーバごとの変数に記載したパスのファイルが取得されているのを確認してください。  

※ディレクトリが表示されない場合は、エディタ上の以下の位置にある更新ボタンを押してください。

![](img/refresh.png)

---

- [前のページに戻る](step7.md)
- [目次](README.md)
- [解説に進む](step8a.md)
