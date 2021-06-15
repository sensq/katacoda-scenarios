# Roleに変数を定義する

演習1-1で実装したRoleは必ず`My name is Taro.`という内容のファイルが実行対象のサーバの`/tmp`に配置される仕様になっていました。  
この仕様ではTaroさん以外はTemplateファイルを直接書き換える必要があります。  
また、配置場所を変更したい場合もコードを直接書き換える必要があります。  
このような「書き換える可能性があるパラメータ」に関しては、変数化を行っておくことで汎用性や可読性を高められ、保守管理を行いやすくできます。

## 演習2-1：1-1で実装したRoleを変数化する

1-1で実装した`simple_role`に以下の手順で変更を加え、変数化したTemplateファイルを配置するRoleを実装してください。  
なお、わかりやすさを優先して手順に番号を振っていますが、実際はどの順番で変更してもまったく問題ありません。

１. `roles/simple_role/tasks/main.yaml`{{open}}に以下をコピペします。

`/tmp`以外にも配置できるように`dest`で指定しているパラメータを変数化します。  
変数化は適当に決めた変数名を`"{{ }}"`で括るだけでよいです。  
また、タスク名にも変数は使えるため、上手く使うと可読性が高まります。  
※タスク名のように、文字列内に変数を埋め込む場合は全体が`"`（ダブルクォーテーション）で括られていればよいです。

```yaml
- name: "put template_file to {{ dest_dir }}"
  template:
    src: ./templates/testfile.j2
    dest: "{{ dest_dir }}/testfile"
```{{copy}}

２. `roles/simple_role/templates/testfile.j2`{{open}}に以下をコピペします。

`Taro`さん以外の名前にも変更できるように`Taro`と記述していた部分を変数化します。  
※理由は省略しますが、Template内では`"`で括る必要ありません。

```text
My name is {{ user_name }}.
```{{copy}}

３. `roles/simple_role/vars/main.yaml`{{open}}に以下をコピペします。

変数化した変数が実際に参照する値を定義します。  
ここで定義した値が実行時に同名の変数が記述されている部分へ展開されて実行されます。  
このRoleでは配置するディレクトリは基本的に固定であるものと想定し、`dest`で指定するディレクトリパス`dest_dir`変数は`vars`に定義することにします。

```yaml
dest_dir: "/tmp"
```{{copy}}

４. `roles/simple_role/defaults/main.yaml`{{open}}に以下をコピペします。

名前は基本的に変更して実行するものであると想定し、Templateファイルで参照している`name`変数は`defaults`に定義することにします。

```yaml
user_name: "Taro"
```{{copy}}

最終的に以下の構成になります。

```
roles/
└── simple_role/
    ├── defaults/
    │   └── main.yaml
    ├── tasks/
    │   └── main.yaml
    ├── templates/
    │   └── testfile.j2
    └── vars/
        └── main.yaml
```

## 演習2-2: 上記のRoleを実行する

`ansible-playbook -i inventory playbook_simple_role.yaml`{{execute}}

1-1から処理内容は変わっていないため、Changedは発生しないはずです。  
実行結果の確認は以下のコマンドで行なえます。

`ansible -m shell -a "cat /tmp/testfile" -i inventory all`{{execute}}

以下のように出力されるはずです。

```
target01 | CHANGED | rc=0 >>
My name is Taro.
target02 | CHANGED | rc=0 >>
My name is Taro.
```

## 演習2-3:変数の値を書き換えて実行してみる

１. `roles/simple_role/vars/main.yaml`{{open}}に以下をコピペします。

```yaml
dest_dir: "/root"
```{{copy}}

２. `roles/simple_role/defaults/main.yaml`{{open}}に以下をコピペします。

```yaml
user_name: "Jiro"
```{{copy}}

３. Playbookを再実行します

`ansible-playbook -i inventory playbook_simple_role.yaml`{{execute}}

今回はChangedになるはずです。

４. 実行確認をします

`ansible -m shell -a "cat /root/testfile" -i inventory all -b`{{execute}}

以下のように出力されるはずです。

```text
target01 | CHANGED | rc=0 >>
My name is Jiro.
target02 | CHANGED | rc=0 >>
My name is Jiro.
```
