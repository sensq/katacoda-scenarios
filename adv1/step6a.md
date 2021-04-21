# 課題3-回答: テンプレートを利用してファイルを配布する

`roles/kadai-4/tasks/loop.yaml`

```yaml
- name: fetch files
  fetch:
    src: "{{ item }}"
    dest: ./kadai-4_fetch_files/
  loop: "{{ fetch_files }}"
```{{copy}}

⚠️  
参考書やインターネットの情報を調べると`loop`ではなく`with_items`を使用している例が多く見つかると思いますが、これは以前のバージョンだと`with_items`を使うことが一般的であったためです。  
Ansibleはバージョンアップによる機能追加や変更が頻繁に行われていますが、初期の頃から利用者が多かったため、すでに古くなってしまっている情報がたくさんあります。  
古い書き方でも動く場合は多いですが、なるべく新しい書き方が推奨されるため、なるべく公式のドキュメントで確認する癖を付けておくとよいです。

`roles/kadai-4/tasks/main.yaml`

```yaml
- include: loop.yaml
```{{copy}}
