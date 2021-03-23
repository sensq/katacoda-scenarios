# サンプルのPlaybookの中身を見ていく

どのような流れで処理が実行されているのかを確認していきます。  
テキストには便宜上`cat`コマンドで確認する手順のみ記載していますが、エディタ上でも確認してみてください。

## 1. Playbookの確認

`cat playbook_sample.yaml`{{execute}}

インベントリに記載されているホストすべてに`common`ロールを実行するPlaybookであることがわかります。

## 2. Roleの確認

上記で確認した`common`ロールの中身を確認していきます。
まずは`main.yaml`を確認してください。

`cat roles/common/tasks/main.yaml`{{execute}}

`include: task_sample.yaml`と記載されていることから、次に`task_sample.yaml`が実行されるであろうことが予想できると思います。  
次に`task_sample.yaml`を確認してください。

`cat roles/common/tasks/task_sample.yaml`{{execute}}

このファイルには`copy`モジュールのタスクが定義されており、`files/copytestfile`ファイルをターゲットの`/tmp`へ配置していることがわかります。  
`main.yaml`で`include`しているのはこのファイルのみのため、このロールで実行される処理は上記のみであることがわかります。

## 3. Playbookの構成まとめ

以上より、サンプルのPlaybook実行に関するディレクトリ構成をシンプルに図でまとめると以下のように表せます。  
この構成はAnsible公式でも[ベストプラクティス構成](https://docs.ansible.com/ansible/2.9_ja/user_guide/playbooks_best_practices.html#directory-layout)として紹介されており、
基本的なディレクトリ構成となります。

![](https://raw.githubusercontent.com/sensq/katacoda-scenarios/main/test/img/playbook.drawio.svg)

> ⚠️ 注意点  
> 今回のサンプルPlaybookはシンプルな作りのため、ファイル数の非常に少ない構成となっています。  
> より実践的な使い方をする場合は、変数定義用のファイルを配置するディレクトリなど、他にもいくつかのディレクトリを作成します。
