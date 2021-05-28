# 課題5: 条件分岐を使う

本課題では、whenを使って特定の場合にだけ処理を実行するPlaybookを作る方法について学んでもらいます。  
題材として、特定の変数が定義されているターゲットにのみfetchを実行するPlaybookを作ります。

## 1. Playbookの作成

`playbook_kadai-5.yaml`に以下をコピペします。

```yaml
- hosts: all
  roles:
    - kadai-5
```{{copy}}

## 2. インベントリファイルに変数を定義

Step 6で作成したインベントリファイルと同様の状態にしておいてください。

## 3. タスクの作成

[Ansibleの公式ドキュメント](https://docs.ansible.com/ansible/latest/index.html)の[fetchモジュール](https://docs.ansible.com/ansible/2.9_ja/modules/fetch_module.html#fetch-module)と[条件](https://docs.ansible.com/ansible/2.9_ja/user_guide/playbooks_conditionals.html)を参考に、`roles/kadai-5/tasks/when.yaml`へタスクを作成します。  
実装の要件は以下の通りです。

* `fetch`モジュールを使うこと
* `server_location`の値が「豊洲」になっているターゲットサーバからのみ、`/etc/passwd`ファイルを取得すること
* 取得したファイルは`works`ディレクトリ直下の`kadai-5_fetch_files`というディレクトリに配置すること
* `roles/kadai-5/tasks/main.yaml`に`when.yaml`を読み込む記述を行うこと

回答例は次のページに記載していますが、どうしても上手くいかない場合にだけ参考にしてください。

## 4. Playbookを実行

`ansible-playbook -i inventory playbook_kadai-5.yaml`{{execute}}

## 5. 取得したファイルの確認

Playbookを実行すると、`works`ディレクトリ直下に`kadai-5_fetch_files`というディレクトリが表示されます。  
その中に`server_location: 豊洲`と記載したターゲットサーバ（＝2号機）から取得したファイルのみが入っていることを確認してください。  

※ディレクトリが表示されない場合は、エディタ上の以下の位置にある更新ボタンを押してください。

![](https://raw.githubusercontent.com/sensq/katacoda-scenarios/main/adv1/img/refresh.png)
