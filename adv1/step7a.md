# 課題3-回答: テンプレートを利用してファイルを配布する

`roles/kadai-5/tasks/when.yaml`

```yaml
- name: fetch 「/etc/passwd」
  fetch:
    src: /etc/passwd
    dest: ./kadai-5_fetch_files/
  when: server_location == "豊洲"
```{{copy}}


`roles/kadai-5/tasks/main.yaml`

```yaml
- include: when.yaml
```{{copy}}
