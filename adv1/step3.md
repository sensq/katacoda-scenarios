# 課題1: Ansibleでファイルを収集する

本課題では、簡単なPlaybookの構成と作り方について学んでもらいます。  
題材として、fetchモジュールを使ったPlaybookを作ります。  
本課題は最初の課題のため、コピペだけで作れるようにテキストを作成しています。

## 1. Playbookの作成

`playbook_kadai-1.yaml`{{open}}に以下をコピペします。

```yaml
- hosts: all
  roles:
    - kadai-1
```{{copy}}

## 2. タスクの作成

`roles/kadai-1/tasks/fetch.yaml`{{open}}に以下をコピペします。

```yaml
- name: fetch 「/etc/passwd」
  fetch:
    src: /etc/passwd
    dest: ./kadai-1_fetch_files/
```{{copy}}


`roles/kadai-1/tasks/main.yaml`{{open}}に以下をコピペします。

```yaml
- include: fetch.yaml
```{{copy}}

## 3. Playbookを実行

`ansible-playbook -i inventory playbook_kadai-1.yaml`{{execute}}

## 4. 取得したファイルの確認

Playbookを実行すると、`works`ディレクトリ直下に`kadai-1_fetch_files`というディレクトリが表示されます。  
その中に各ターゲットサーバごとの`/etc/passwd`ファイルが取得されているのを確認してください。  

※ディレクトリが表示されない場合は、エディタ上の以下の位置にある更新ボタンを押してください。

![](https://raw.githubusercontent.com/sensq/katacoda-scenarios/main/adv1/img/refresh.png)
