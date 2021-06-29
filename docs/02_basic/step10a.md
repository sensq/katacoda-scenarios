# 課題5-回答: 条件分岐を使う

`roles/kadai-5/tasks/main.yaml`

```yaml
- name: fetch 「/etc/passwd」
  fetch:
    src: /etc/passwd
    dest: ./kadai-5_fetch_files/
  when: server_location == "豊洲"
```

---

- [前のページに戻る](step10.md)
- [目次](README.md)
- [次のページに進む](step11.md)
