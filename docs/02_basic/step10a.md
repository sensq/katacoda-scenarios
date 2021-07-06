# 課題5-回答: 条件分岐を使う

`roles/kadai-5/tasks/main.yaml`

```yaml
- name: fetch 「/etc/passwd」
  fetch:
    src: /etc/passwd
    dest: ./kadai-5_fetch_files/
  when: server_hostname == "target-server-01"
```

他にも正解となるコードはいろいろあります。  
target02への実行がskipになっていてtarget01からのみファイルを取得できていればよいです。

## ★発展的な解説

以下のように配列形式でwhenに複数の条件を指定するとAND条件になり、すべての条件が真（True）の場合にのみタスクが実行されます。  

```yaml
- name: fetch 「/etc/passwd」
  fetch:
    src: /etc/passwd
    dest: ./kadai-5_fetch_files/
  when:  # 以下の3つが全部Trueだとタスクが実行される
    - server_hostname == "target-server-01"
    - foo_var == 1  # foo_varが1だとTrue
    - bar_var is undefined  # bar_var変数が未定義だとTrue
```

OR条件で条件を指定したい場合は以下のように指定します。

```yaml
- name: fetch 「/etc/passwd」
  fetch:
    src: /etc/passwd
    dest: ./kadai-5_fetch_files/
  when: foo_var == 1 or bar_var is undefined  # 「foo_varが1」または「bar_var変数が未定義」だとTrue
```

また、以下のようにANDとORを複合的に指定することも可能です。  
ただし、複雑すぎる条件は可読性を低下させたりバグの原因になったりするため、使用する際はより良い方法がないかなど検討するとよいです。

```yaml
- name: fetch 「/etc/passwd」
  fetch:
    src: /etc/passwd
    dest: ./kadai-5_fetch_files/
  when:  # 以下の2つが両方Trueだとタスクが実行される
    - server_hostname == "target-server-01"
    - foo_var == 1 or bar_var is undefined
```

---

- [前のページに戻る](step10.md)
- [目次](README.md)
- [次のページに進む](step11.md)

