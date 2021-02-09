# 環境の準備

1. 以下のコマンドを実行します  
`bash /tools/setup.sh && source /etc/profile.d/init-env.sh && cd ~/works`{{execute}}

2. Ansibleが実行できることを確認します  
`ansible -m ping -i inventory all`{{execute}}

以下の環境が構築されます。

![](https://raw.githubusercontent.com/sensq/katacoda-scenarios/main/test/img/arch.drawio.svg)
