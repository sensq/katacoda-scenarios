# 課題6-1: モジュールに存在しない処理を実行する

本課題では、shellモジュールを使ってAnsibleでLinuxコマンドを実行する方法について学んでもらいます。  
題材として、特定のファイルに特定の記述がされている場合にのみ、特定のコマンドを実行するPlaybookを作成します。

## 1. Playbookの作成

`playbook_kadai-6-1.yaml`に以下をコピペします。

```yaml
- hosts: all
  roles:
    - kadai-6-1
```{{copy}}

## 2. タスクの作成

[Ansibleの公式ドキュメント](https://docs.ansible.com/ansible/latest/index.html)の[shellモジュール](https://docs.ansible.com/ansible/2.9_ja/modules/fetch_module.html#fetch-module)を参考に、`roles/kadai-6-1/tasks/shell.yaml`へタスクを作成します。  
実装の要件は以下の通りです。

* `shell`モジュールで`echo "test in checkfile" > ~/resultfile`を実行するタスクを作成すること
* ターゲットサーバの`~/checkfile`に`test`という文字列が記載されていた場合のみ、上記タスクを実行すること
  * ヒント：`grep test ~/checkfile | wc -l`で記載有無の確認ができます
  * ヒント：`register`という機能を利用すると、コマンドの実行結果を変数に保持させることができます
* `roles/kadai-6-1/tasks/main.yaml`に`shell.yaml`を読み込む記述を行うこと
* 冪等性は考慮しなくてよい

回答例は次のページに記載していますが、どうしても上手くいかない場合にだけ参考にしてください。

## 3. Playbook実行の前の準備

ターゲットサーバの1号機でのみ、`checkfile`ファイルを作成します。

`ssh target01 -i /root/.ssh/test_key "echo test > checkfile"`{{execute}}

## 4. Playbookを実行

`ansible-playbook -i inventory playbook_kadai-6-1.yaml`{{execute}}

1号機のみ`changed`になり、2号機は`skipping`になれば正しく実行できています。  
なお、このPlaybookは冪等性を考慮していない構成になっているはずなので、何度か実行して毎回`changed`が発生してしまうことも確認しておくとよいです。

## 5. 実行確認

1号機に`resultfile`ファイルが作成されていることを確認します。

`ssh target01 -i /root/.ssh/test_key "cat resultfile"`{{execute}}
