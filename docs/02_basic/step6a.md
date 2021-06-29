# 課題3-回答: テンプレートを利用してファイルを配布する

`roles/kadai-3/tasks/main.yaml`

```yaml
- name: template file
  template:
    src: ./templates/template_file.j2
    dest: /tmp/template_file
```

---

- [前のページに戻る](step6.md)
- [目次](README.md)
- [次のページに進む](step7.md)
