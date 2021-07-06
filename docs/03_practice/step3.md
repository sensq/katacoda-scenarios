# Roleのベストプラクティス構成

Roleは特定の名前のディレクトリ内のファイルを自動的に読み込むようになっています。  
このディレクトリ構成はベストプラクティスと呼ばれることが多く、これに従ってRoleを実装することで再利用しやすいRoleになります。  
なお、Role内で使用しない要素のディレクトリに関しては作成する必要ありません。

![](https://raw.githubusercontent.com/sensq/katacoda-scenarios/main/practice/img/bestpractice.drawio.svg)

※本演習では`handlers`と`meta`は対象外とし、特に解説はしません。

## 演習1-1：ベストプラクティス構成でRoleを実装する

`playbook_simple_role.yaml`に`simple_role`Roleを実行するPlaybookが配置されています。  
この`simple_role`に以下の手順でTemplateファイルを配置するRoleを実装してください。

１. タスクの作成

`roles/simple_role/tasks/main.yaml`に以下をコピペしてください。

```yaml
- name: "put template_file to /tmp"
  template:
    src: ./templates/testfile.j2
    dest: /tmp/testfile
```

２. Templateファイルの作成

`roles/simple_role/templates/testfile.j2`に以下をコピペしてください。

```text
My name is Taro.
```

## 演習1-2: 上記のRoleを実行する

１. Playbookの実行

以下のコマンドでPlaybookを実行します。

```bash
ansible-playbook -i inventory playbook_simple_role.yaml
```

２. 実行確認

以下のコマンドで実行対象に配置されたファイルの内容を確認します。

```bash
ansible -m shell -a "cat /tmp/testfile" -i inventory all
```

以下のように出力されるはずです。  
これでベストプラクティスのディレクトリ構成でRoleを実装することができました。

```
target01 | CHANGED | rc=0 >>
My name is Taro.
target02 | CHANGED | rc=0 >>
My name is Taro.
```


⚠️補足  
変数には任意の名前を付けることができますが、「文字、数字、アンダースコア」以外を使用することはできず、
変数名の1文字目には数字を使えないという制約があります。  
推奨はしませんが、文字であれば全角や日本語でも使用可能です。  
また、`name`や`environment`などの「予約語」と呼ばれる一部の特殊な文字列は変数名に使用することができません。  
予約語のリストは公式に公開されていないようですが、予約語を変数名にした場合はAnsible実行時に  
`[WARNING]: Found variable using reserved name: environment`  
`ERROR! Invalid variable name in vars specified for Play: 'class' is not a valid variable name`  
というような警告やエラーが表示されるため、この場合は変数名を変更してください。

---

- [前のページに戻る](step2a.md)
- [目次](README.md)
- [次のページに進む](step4.md)
