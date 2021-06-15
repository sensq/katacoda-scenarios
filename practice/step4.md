# Roleのベストプラクティス構成

Roleは特定の名前のディレクトリ内のファイルを自動的に読み込むようになっています。  
このディレクトリ構成はベストプラクティスと呼ばれることが多く、これに従ってRoleを実装することで再利用しやすいRoleになります。  
なお、Role内で使用しない要素のディレクトリに関しては作成する必要ありません。  
![](https://raw.githubusercontent.com/sensq/katacoda-scenarios/main/practice/img/bestpractice.drawio.svg)

※本演習では`handlers`と`meta`は対象外とし、特に解説はしません。

## 演習1-1：ベストプラクティス構成でRoleを実装する

`playbook_simple_role.yaml`{{open}}に`simple_role`Roleを実行するPlaybookが配置されています。  
この`simple_role`に以下の手順でTemplateファイルを配置するRoleを実装してください。

１. `roles/simple_role/tasks/main.yaml`{{open}}に以下をコピペします。

```yaml
- name: "put template_file to /tmp"
  template:
    src: ./templates/testfile.j2
    dest: /tmp/testfile
```{{copy}}

２. `roles/simple_role/templates/testfile.j2`{{open}}に以下をコピペします。

```text
My name is Taro.
```{{copy}}

## 演習1-2: 上記のRoleを実行する

`ansible-playbook -i inventory playbook_simple_role.yaml`{{execute}}

実行結果の確認は以下のコマンドで行なえます。

`ansible -m shell -a "cat /tmp/testfile" -i inventory all`{{execute}}

以下のように出力されるはずです。

```
target01 | CHANGED | rc=0 >>
My name is Taro.
target02 | CHANGED | rc=0 >>
My name is Taro.
```
