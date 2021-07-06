# 課題4-回答: ループを使う

`roles/kadai-4/tasks/main.yaml`

```yaml
- name: "fetch files"
  fetch:
    src: "{{ item }}"
    dest: ./kadai-4_fetch_files/
  loop: "{{ fetch_files }}"
```

:warning:  
参考書やインターネットの情報を調べると`loop`ではなく`with_items`を使用している例が多く見つかると思いますが、これは以前のバージョンだと`with_items`を使うことが一般的であったためです。  
Ansibleはバージョンアップによる機能追加や変更が頻繁に行われていますが、初期の頃から利用者が多かったため、すでに古くなってしまっている情報がたくさんあります。  
古い記法でも動く場合は多いですが、基本的に新しい記法が推奨されるため、なるべく公式のドキュメントで確認する癖を付けておくとよいです。

## ★発展的な解説

課題で提示したインベントリファイルには、ハイフンから始まる行が記載されていました。  
一方で、課題3で使用した変数や他の変数はすべて変数名が記載されています。

```yaml
all:
  hosts:
    target01:
      ansible_port: 2222
      ansible_user: hoge
      server_hostname: target-server-01  # 課題3で使用した変数（マップ）
      fetch_files:  # ココからの2行はハイフンから始まっている（配列）
        - /etc/passwd
        - /etc/ssh/sshd_config
    target02:
      ansible_port: 2223
      ansible_user: foo
      server_hostname: target-server-02  # 課題3で使用した変数（マップ）
      fetch_files:  # ココからの3行はハイフンから始まっている（配列）
        - /etc/group
        - /etc/profile
        - /proc/cpuinfo
  vars:
    ansible_ssh_private_key_file: ~/.ssh/test_key
```

この書き方の違いはそれぞれ「**配列**（リストとも言われる）」と「**マップ**（ハッシュ、連想配列などとも言われる）」を表しています。  
マップの方は変数名1つ1つに値が定義されていましたが、配列には変数名1つに対して複数の値を定義できます。  
具体的には`all.hosts.target01.server_hostname`には`target-server-01`という値が定義されており、`all.hosts.target01.fetch_files`には`/etc/passwd`と`/etc/ssh/sshd_config`が定義されています。  
配列とマップは一般的なプログラミング言語でも仕様として用意されていることが多く、Ansibleでのメリットや使い分け方も概ねそれらと同様になります。  
マップでもループさせることは可能なため、目的や可読性、利便性などを考慮してどちらで実装する方が良いかを判断し、使い分けていくことになります。

なお、配列とマップは複合的に定義することが可能であるため、マップの中に配列を定義することも、マップを配列で複数定義することも可能です。  
例えば取得するファイルごとに`dest`も変更したい場合は以下のような変数構造にするとよいです。

```yaml
all:
  hosts:
    target01:
      ansible_port: 2222
      ansible_user: hoge
      server_hostname: target-server-01  # 課題3で使用した変数
      fetch_files:
        - path: /etc/passwd
          dest: /tmp/test4/foo
        - path: /etc/ssh/sshd_config
          dest: /tmp/test4/bar
    target02:
      ansible_port: 2223
      ansible_user: foo
      server_hostname: target-server-02
      fetch_files:
        - path: /etc/group
          dest: /tmp/test4/foo
        - path: /etc/profile
          dest: /tmp/test4/bar
        - path: /proc/cpuinfo
          dest: /tmp/test4/hoge
  vars:
    ansible_ssh_private_key_file: ~/.ssh/test_key
```

タスクは以下のように書き換えます。

```yaml
- name: fetch files
  fetch:
    src: "{{ item.path }}"
    dest: "{{ item.dest }}"
  loop: "{{ fetch_files }}"
```

以下でPlaybookを実行し、指定した通りにファイルを取得できていることを確認してみてください。

```bash
# Playbook実行
ansible-playbook -i inventory playbook_kadai-4.yaml
# 取得確認
tree /tmp/test4/
```

---

- [前のページに戻る](step8.md)
- [目次](README.md)
- [次のページに進む](step9.md)

