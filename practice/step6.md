# Roleを使う

演習2-1で変数化を行いましたが、変数の値を変更したい場合は結局Roleディレクトリ内のファイルを書き換えていました。  
この運用ではRoleを使い回しにくいですし、実行対象ごとに異なる値を定義することができません。  
そこで、Ansibleにはサーバごとに変数を定義できるように`host_vars`と呼ばれる仕組みが存在しています。

## 演習3-1：host_varsを作成してRoleを実行する

host_varsは`host_vars`という名前のディレクトリを作成し、
その中にインベントリで記載している実行対象と同じ名前のYamlファイルを作成することで行います。  
すでにファイルは作成済みなため、以下の手順でファイルを編集してください。

１. `target01`のhost_varsに変数を定義する

`host_vars/target01.yaml`に以下をコピペします。

```yaml
user_name: "Alice"
```{{copy}}

２. `target02`のhost_varsに変数を定義する

`host_vars/target02.yaml`に以下をコピペします。

```yaml
user_name: "Bob"
```{{copy}}

３. Playbookを再実行します

`ansible-playbook -i inventory playbook_simple_role.yaml`{{execute}}

今回もChangedになるはずです。

４. 実行確認をします

`ansible -m shell -a "cat /testfile" -i inventory all`{{execute}}

以下のように出力されるはずです。  
サーバごとに異なる変数を定義して実行できていることが確認できます。

```text
target01 | CHANGED | rc=0 >>
My name is Alice.
target02 | CHANGED | rc=0 >>
My name is Bob.
```


⚠️補足  
Ansibleは`host_vars`以外にも変数を定義する方法が複数あります。  
よく使われるものだと、基礎編で使用していたインベントリでの定義、グループごとに変数を定義する`group_vars`があります。  
他の方法に関しては、使用頻度の低い方法や保守管理を考慮すると使わない方がよい方法がほとんどなため、興味があれば[公式サイトの解説ページ](https://docs.ansible.com/ansible/2.9_ja/user_guide/playbooks_variables.html)を参照してください。
