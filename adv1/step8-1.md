# 課題6-1: モジュールに存在しない処理を実行する

shellモジュールを使ってAnsibleでLinuxコマンドを実行する。

## 1. Playbookの作成

`playbook_kadai-6-1.yaml`に以下をコピペ

```yaml
- hosts: all
  roles:
    - kadai-6-1
```{{copy}}

## 2. タスクの作成

[Ansibleの公式ドキュメント](https://docs.ansible.com/ansible/latest/index.html)の[shellモジュール](https://docs.ansible.com/ansible/2.9_ja/modules/fetch_module.html#fetch-module)を参考に、`roles/kadai-6-1/tasks/shell.yaml`へタスクを作成する。  
実装の要件は以下の通り

* `shell`モジュールで`echo "test in checkfile" > ~/resultfile`を実行するタスクを作成すること
* ターゲットサーバの`~/checkfile`に`test`という文字列が記載されていた場合のみ、上記タスクを実行すること
  * ヒント：`grep test ~/checkfile | wc -l`で記載有無の確認ができます
* `roles/kadai-6-1/tasks/main.yaml`に`shell.yaml`を読み込む記述を行うこと
* 冪等性は考慮しなくてよいです

回答例は次のページに記載しているが、どうしても上手くいかない場合にだけ参考にすること。

## 3. Playbook実行の前の準備

ターゲットサーバの1号機でのみ、`checkfile`ファイルを作成する。

`ssh target01 -i /root/.ssh/test_key "echo test > checkfile"`{{execute}}

## 4. Playbookを実行

`ansible-playbook -i inventory playbook_kadai-6-1.yaml`{{execute}}

1号機のみ`changed`になり、2号機は`skipping`になれば正しく実行できている。  
なお、このPlaybookは冪等性を考慮していない構成になっているはずなので、何度か実行して毎回`changed`が発生してしまうことも確認しておくとよい。

## 5. 実行確認

1号機に`resultfile`ファイルが作成されていることを確認する。

`ssh target01 -i /root/.ssh/test_key "cat resultfile"`{{execute}}
