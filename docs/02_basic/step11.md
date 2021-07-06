Start - [1](step1.md) - [2](step2.md) - [3](step3.md) - [4](step4.md) - [5](step5.md) - [6](step6.md) - [7](step7.md) - [8](step8.md) - [9](step9.md) - [10](step10.md) - [**11**](step11.md) - [12](step12.md) - End


# 課題6-1: モジュールに存在しない処理を実行する

本課題では、shellモジュールを使ってAnsibleでシェルコマンドを実行する方法について学んでもらいます。

## 1. Playbookの作成

`playbook_kadai-6-1.yaml`に以下をコピペします。

```yaml
- hosts: all
  roles:
    - kadai-6-1
```

## 2. タスクの作成

[shellモジュールのドキュメント](https://docs.ansible.com/ansible/2.9_ja/modules/shell_module.html)を参考に、`roles/kadai-6-1/tasks/main.yaml`へタスクを作成します。  
実装の要件は以下の通りです。

* `shell`モジュールで`hostname >> ~/resultfile`を実行するタスクを作成すること
* 冪等性は考慮しなくてよい

回答例は次のページに記載していますが、どうしても上手くいかない場合にだけ参考にしてください。

## 3. Playbookを実行

```bash
ansible-playbook -i inventory playbook_kadai-6-1.yaml
```

:warning:  
このPlaybookは冪等性を考慮していない構成になっているはずなので、何度か実行して毎回`changed`が発生してしまうことも確認しておくとよいです。  
また、実行するたびに`~/resultfile`にホスト名の記載された行が増えていくことも確認しておくとよいです。

## 4. 実行確認

`hostname >> ~/resultfile`コマンドを実行すると`~`（ホームディレクトリ）に`resultfile`ファイルが作成されるため、
このファイルが作成されていることを確認します。

### 1号機

```bash
ssh target01 -i /root/.ssh/test_key "cat resultfile"
```

### 2号機

```bash
ssh target02 -i /root/.ssh/test_key "cat resultfile"
```

以下でも確認可能です。

```bash
ansible -m shell -a "sudo cat /root/resultfile" -i inventory all
```

---

- [前のページに戻る](step10a.md)
- [目次](README.md)
- [解説に進む](step11a.md)

