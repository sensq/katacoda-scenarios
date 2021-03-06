# temp

最初に`cd ~/works`に移動しておくこと。  
`cd ~/works`{{execute}}

## SSH接続
`ssh target01 -i /root/.ssh/test_key`{{execute}}  
`ssh target02 -i /root/.ssh/test_key`{{execute}}  

## インベントリ確認
`ansible-inventory -i inventory --list -y`{{execute}}

## nginxインストール
`ansible-playbook -i inventory site_nginx.yaml`{{execute}}

