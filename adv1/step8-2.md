# 課題6-2: モジュールに存在しない処理の冪等性を考える

shellモジュールは、使うと必ずchangedになってしまう（＝毎回実行されてしまう）という仕様があります。  
実行する必要のない状態で実行すると問題になる処理もあるため、処理内容に応じて冪等性を保つためのPlaybookを実装することが望ましい実装になります。  
本課題では、このような処理の有無を分岐させる方法について学んでもらいます。

## 1. Playbookの作成

`playbook_kadai-6-2.yaml`に以下をコピペします。

```yaml
- hosts: all
  roles:
    - kadai-6-2
```{{copy}}

## 2. タスクの作成

`roles/kadai-6-2/tasks/shell.yaml`に前課題の回答が記載されているため、このファイルに修正を加えて冪等性の考慮されたPlaybookにします。  
実装の要件は以下の通りです。

* Playbook実行で`changed`が発生しないこと
  * 前課題のPlaybookを実行していない場合、初回のみ`changed`が発生しても問題ない
* `echo "test in checkfile" > ~/resultfile`を実行するタスクは1号機も2号機も`skipping`になること

回答例は次のページに記載していますが、どうしても上手くいかない場合にだけ参考にしてください。
なお、冪等性を保つための方法はshellの処理内容によっていろいろ考えられるため、特に明確な正解はありません。

## 3. Playbookを実行

以下の順番で実行してください。

過去の実行で作成された`resultfile`を削除  
`ssh target01 -i /root/.ssh/test_key "rm -f resultfile"`{{execute}}

Playbookを実行  
`ansible-playbook -i inventory playbook_kadai-6-2.yaml`{{execute}}

`resultfile`が作成されたことを確認  
`ssh target01 -i /root/.ssh/test_key "cat resultfile"`{{execute}}

Playbookを再実行し、skippingになることを確認  
`ansible-playbook -i inventory playbook_kadai-6-2.yaml`{{execute}}
