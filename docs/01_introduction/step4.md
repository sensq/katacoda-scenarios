Start - [1](step1.md) - [2](step2.md) - [3](step3.md) - [**4**](step4.md) - [5](step5.md) - [6](step6.md) - [7](step7.md) - End

# サンプルのPlaybookを実行する

## 1. インベントリ確認

インベントリファイルの確認方法を学びます。  
現時点では、中身の内容を理解しなくても問題ありません。

1. エディタ上の`inventory`ファイルをクリックし、ファイルの中身を確認します
2. `ansible-inventory`コマンドでもインベントリを確認できることを確認します  

```bash
ansible-inventory -i inventory --list -y
```

## 2. Ansibleの設定ファイル確認

Ansibleの設定ファイルの確認方法を学びます。  
現時点では、中身の内容を理解しなくても問題ありません。

1. エディタ上の`ansible.cfg`ファイルをクリックし、ファイルの中身を確認します
2. `ansible-config view`コマンドでもインベントリを確認できることを確認します  

```bash
ansible-config view
```

## 3. サンプルのPlaybookを実行する

Playbookを実行する方法について学びます。  
現時点では、Playbookの中身を理解しなくても問題ありません。

* ポイント
    * `ansible-playbook`コマンドを使用する
    * 「どこへ」実行するのかをインベントリファイルで指定する
    * 「何を」実行するのかをPlaybookで指定する

以下のコマンドを実行することで、サンプルのPlaybookが実行されます。  

```bash
ansible-playbook -i inventory playbook_sample.yaml
```

---

- [前のページに戻る](step3.md)
- [目次](README.md)
- [次のページに進む](step5.md)
