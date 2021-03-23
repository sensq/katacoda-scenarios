# 課題5: 条件分岐を使う

whenを使って特定の場合にだけfetchを実行するPlaybookを作る。

## 1. Playbookの作成

`playbook_kadai-5.yaml`に以下をコピペ

```yaml
- hosts: all
  roles:
    - kadai-5
```{{copy}}

## 2. インベントリファイルに変数を定義

Step 6で作成したインベントリファイルと同様の状態にしておいてください。

## 3. タスクの作成

`roles/kadai-5/tasks/when.yaml`に以下をコピペ

```yaml
- name: fetch 「/etc/passwd」
  fetch:
    src: /etc/passwd
    dest: ./kadai-5_fetch_files/
  when: server_location == "豊洲"
```{{copy}}


`roles/kadai-5/tasks/main.yaml`に以下をコピペ

```yaml
- include: when.yaml
```{{copy}}

## 4. Playbookを実行

`ansible-playbook -i inventory playbook_kadai-5.yaml`{{execute}}

## 5. 取得したファイルの確認

Playbookを実行すると、`works`ディレクトリ直下に`kadai-5_fetch_files`というディレクトリが表示されます。  
その中に`server_location: 豊洲`と記載したターゲットサーバ（＝2号機）から取得したファイルのみが入っていることを確認してください。  

※ディレクトリが表示されない場合は、エディタ上の以下の位置にある更新ボタンを押してください。

![](https://raw.githubusercontent.com/sensq/katacoda-scenarios/main/adv1/img/refresh.png)
