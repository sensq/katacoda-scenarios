# サンプルのPlaybookを実行する

## インベントリ確認

インベントリファイルの確認方法を学びます。  
現時点では、中身の内容を理解しなくても問題ありません。

1. ファイルの中身を確認します  
`cat inventory`{{execute}}  
2. `ansible-inventory`コマンドでもインベントリを確認できることを確認します  
`ansible-inventory -i inventory --list -y`{{execute}}

## Ansibleの設定ファイル確認

Ansibleの設定ファイルの確認方法を学びます。  
現時点では、中身の内容を理解しなくても問題ありません。

1. ファイルの中身を確認します  
`cat ansible.cfg`{{execute}}  
2. `ansible-config view`コマンドでもインベントリを確認できることを確認します  
`ansible-config view`{{execute}}

## サンプルのPlaybookを実行する

Playbookを実行する方法について学びます。  
現時点では、Playbookの中身を理解しなくても問題ありません。

* ポイント
    * `ansible-playbook`コマンドを使用する
    * 「どこへ」実行するのかをインベントリファイルで指定する
    * 「何を」実行するのかをPlaybookで指定する

以下のコマンドを実行することで、サンプルのPlaybookが実行されます。  
`ansible-playbook -i inventory playbook_sample.yaml`{{execute}}
