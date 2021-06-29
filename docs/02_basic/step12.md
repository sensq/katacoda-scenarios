Start - [1](step1.md) - [2](step2.md) - [3](step3.md) - [4](step4.md) - [5](step5.md) - [6](step6.md) - [7](step7.md) - [8](step8.md) - [9](step9.md) - [10](step10.md) - [11](step11.md) - [**12**](step12.md) - End

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
```

## 2. タスクの作成

`roles/kadai-6-2/tasks/main.yaml`に前課題の回答が記載されているため、このファイルに修正を加えて冪等性の考慮されたPlaybookにします。  
実装の要件は以下の通りです。

* Playbook実行で`changed`が発生しないこと
  * 前課題のPlaybookを実行していない場合、初回のみ`changed`が発生しても問題ない
* `hostname >> ~/resultfile`を実行するタスクは`skipping`になること
  * ヒント1：Playbookを一度でも実行すると、`~/resultfile`ファイルが作成されることを利用する
  * ヒント2：`stat`というモジュールでファイルの存在有無を確認できる
  * ヒント3：`register`という仕組みでタスクの実行結果を変数に保持できる

回答例は次のページに記載しています。  
本課題は若干難易度が高く、実装の自由度も高いため、難しいと感じた場合は早々に見切りを付けて回答例を見てしまっても構いません。  
なお、冪等性を保つための方法はシェルコマンドの処理内容によっていろいろ考えられるため、特に明確な正解はありません。

## 3. Playbookを実行

以下の順番で実行してください。

過去の実行で作成された`resultfile`を削除  
`ssh target01 -i /root/.ssh/test_key "rm -f ~/resultfile"`  
`ssh target02 -i /root/.ssh/test_key "rm -f ~/resultfile"`

Playbookを実行  
`ansible-playbook -i inventory playbook_kadai-6-2.yaml`

`resultfile`が作成されたことを確認  
`ssh target01 -i /root/.ssh/test_key "cat ~/resultfile"`  
`ssh target02 -i /root/.ssh/test_key "cat ~/resultfile"`

Playbookを再実行し、skippingになることを確認  
`ansible-playbook -i inventory playbook_kadai-6-2.yaml`

`resultfile`に1行しか`test in checkfile`と記載された行が無いことを確認  
`ssh target01 -i /root/.ssh/test_key "cat ~/resultfile"`  
`ssh target02 -i /root/.ssh/test_key "cat ~/resultfile"`

---

- [前のページに戻る](step11a.md)
- [目次](README.md)
- [解説に進む](step12a.md)
