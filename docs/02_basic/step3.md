Start - [1](step1.md) - [2](step2.md) - [**3**](step3.md) - [4](step4.md) - [5](step5.md) - [6](step6.md) - [7](step7.md) - [8](step8.md) - [9](step9.md) - [10](step10.md) - [11](step11.md) - [12](step12.md) - End


# Ansible公式ドキュメントの見方を知る

Ansibleは公式ドキュメントが充実しており、頻繁にバージョンアップをされることからも、
コーディング時は基本的に公式ドキュメントを参考にすることになります。  
ここでは主にどのような内容が記載されていて、何を参考にコーディングすればよいのかを説明します。

Ansible公式ドキュメント  
[https://docs.ansible.com/ansible/latest/index.html](https://docs.ansible.com/ansible/latest/index.html)

## モジュールのドキュメントを見る

Ansibleでのコーディングをする際にもっとも参照するのがモジュールのページになります。  
全モジュールのリストはバージョンごとに異なるため、`latest`ではなく使用するバージョン（2021年7月時点での最新は2.9）のページを参照してください。  
サイドメニューから辿っていくこともできますが、以下のリンクから直接アクセスしてもよいです。  
このリストの中から使えそうなモジュールを探していくことになります。  
[https://docs.ansible.com/ansible/2.9/modules/modules_by_category.html](https://docs.ansible.com/ansible/2.9/modules/modules_by_category.html)

今回は課題1で使用したFetchモジュールのページを見ていくことにします。  
上記のページから「[Files modules](https://docs.ansible.com/ansible/2.9/modules/list_of_files_modules.html)」→「[fetch](https://docs.ansible.com/ansible/2.9/modules/fetch_module.html)」と遷移してください。  
なお、今回のように使用したいモジュール名が事前に明確な場合はGoogle等の検索エンジンサイトで「Ansible fetch」のように検索すると手っ取り早いです。

## モジュールページの見方について

各モジュールのページには主にパラメータとサンプルコードが記載されています。  
ここで最低限確認すべきことは、`required`と記載されているパラメータの意味と指定方法になります。  
その他のパラメータに関しては目的に応じて意味や使い方を確認してください。

例えばfetchモジュールの場合はサンプルコードを見ると以下のような記載があります。

```yaml
- name: Store file into /tmp/fetched/host.example.com/tmp/somefile
  fetch:
    src: /tmp/somefile
    dest: /tmp/fetched
```

パラメータの説明では、
`src`は取得対象のファイルパスを指定するパラメータ、`dest`は取得したファイルをAnsible実行サーバのどのディレクトリに配置するのかを指定するパラメータであることが記載されているため、
上記サンプルは実行対象の`/tmp/somefile`ファイルを`/tmp/fetched`ディレクトリに取得するコードだと読み取れます。  
そのため、上記サンプル通りにコードを記載して`src`と`dest`の値を適切に書き換えればコーディングが完了します。  
なお、`name`はどんなタスクなのかを説明するためのパラメータで、任意の文字列を指定することが可能です。省略することも可能です。  
モジュールのパラメータではないため、インデントの深さに注意してください。

---

- [前のページに戻る](step2.md)
- [目次](README.md)
- [次のページに進む](step4.md)
