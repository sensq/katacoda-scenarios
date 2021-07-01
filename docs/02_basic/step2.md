Start - [1](step1.md) - [**2**](step2.md) - [3](step3.md) - [4](step4.md) - [5](step5.md) - [6](step6.md) - [7](step7.md) - [8](step8.md) - [9](step9.md) - [10](step10.md) - [11](step11.md) - [12](step12.md) - End


# 課題1: Ansibleでファイルを収集する

本課題では、簡単なPlaybookの構成と作り方について学んでもらいます。  
題材として、fetchモジュールを使ったPlaybookを作ります。  
本課題は最初の課題のため、コピペだけで作れるようにテキストを作成しています。

## 1. Playbookの作成

`playbook_kadai-1.yaml`に以下をコピペします。

```yaml
- hosts: all
  roles:
    - kadai-1
```

## 2. タスクの作成

`roles/kadai-1/tasks/main.yaml`に以下をコピペします。

```yaml
- name: fetch 「/etc/passwd」
  fetch:
    src: /etc/passwd
    dest: ./kadai-1_fetch_files/
```

## 3. Playbookを実行

```bash
ansible-playbook -i inventory playbook_kadai-1.yaml
```

## 4. 取得したファイルの確認

Playbookを実行すると、`kadai-1_fetch_files`というディレクトリが表示されます。  
その中に各ターゲットサーバごとの`/etc/passwd`ファイルが取得されているのを確認してください。  

※ディレクトリが表示されない場合は、エディタ上の以下の位置にある更新ボタンを押してください。

![](img/refresh.png)

---

- [前のページに戻る](step1.md)
- [目次](README.md)
- [次のページに進む](step3.md)
