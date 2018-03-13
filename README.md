# ivtcro_infra
ivtcro Infra repository

## Команда для подключения в одну команду к someinternalhost
`ssh -J ivtcro@35.195.57.52 ivtcro@someinternalhost`

## Подключение по алиасу к **someinternalhost**
Для подключение к **someinternalhost** командой вида `ssh someinternalhost` необходимо в файле `~/.ssh/config` прописать следующие настройки:
```
	Host someinternalhost
        HostName someinternalhost
        ProxyJump ivtcro@35.195.57.52
        User ivtcro
```

