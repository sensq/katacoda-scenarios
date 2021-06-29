Start - [1](step1.md) - [2](step2.md) - [3](step3.md) - [**4**](step4.md) - [5](step5.md) - [6](step6.md) - [7](step7.md) - [8](step8.md) - [9](step9.md) - [10](step10.md) - End

# 課題2: Ansibleでファイルを配布する

本課題では、Ansibleの公式ドキュメントを参考にしながら自分で簡単なコードを作成する方法について学んでもらいます。  
題材として、copyモジュールを使ったPlaybookを作ります。

## 1. Playbookの作成

`playbook_kadai-2.yaml`に以下をコピペします。

```yaml
- hosts: all
  roles:
    - kadai-2
```

## 2. ターゲットサーバへ配置するファイルの作成

`roles/kadai-2/files/copy_file`に以下をコピペします。

```text
ターゲットサーバに配置されるファイルです。
Ansible実行後にターゲットサーバに配置されていることを確認してください。
```

## 3. タスクの作成

[Ansibleの公式ドキュメント](https://docs.ansible.com/ansible/latest/index.html)の[copyモジュール](https://docs.ansible.com/ansible/2.9_ja/modules/copy_module.html)を参考に、`roles/kadai-2/tasks/main.yaml`へタスクを作成します。  
実装の要件は以下の通りです。

* `copy`モジュールを使うこと
* 2で作成した`roles/kadai-2/files/copy_file`をターゲットサーバの`/tmp/copy_file`へ配置すること
  * ヒント：copyのソースとなるローカルファイルのパスは、絶対パスまたはロールのディレクトリからの相対パスで指定する必要がある
  * 今回の場合は、`roles/kadai-2/`が相対パスの起点となる

回答例は次のページに記載していますが、どうしても上手くいかない場合にだけ参考にしてください。

## 4. Playbookを実行

`ansible-playbook -i inventory playbook_kadai-2.yaml`

## 5. 配置したファイルの確認

各ターゲットサーバへSSH接続し、`/tmp`ディレクトリに`copy_file`というファイルが配置されていることを確認します。  
以下のコマンドを1つ1つ実行していってください。

### 1号機

`ssh target01 -i /root/.ssh/test_key`  
`ls /tmp`  
`cat /tmp/copy_file`  
`exit`

### 2号機

`ssh target02 -i /root/.ssh/test_key`  
`ls /tmp`  
`cat /tmp/copy_file`  
`exit`

---

- [前のページに戻る](step3.md)
- [目次](README.md)
- [次のページに進む](step4a.md)