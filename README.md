# <div align="center">AWS Code Build</div>

`Codebuild` - это инструмент для CI/CD, с помощью него можно автоматически доставлять новую версию ПО на сервер. Codebuild при новом коммите запускает контейнер, в котором будет собираться проект и в последствии при успешной сборке доставлять на сервер, к примеру: EC2, ECS Cluster, EKS, etc.

<div align="center"><b>Для того, что бы создать Pipeline, нужно:</b></div>

1. Build project
2. Передать credentials (например: аутентификационные данные к GitHub)
3. Создать Pipeline в котором будет определенно где будут происходить изменения после интеграции новой версии проекта

## Build project:

В нем создается проект и определяется такие данные:

- `Source` - где CodeBuild будет брать информацию о изменении проекта (SCM: GitHub, BitBucket, AWS CodeCommit, etc.)
- `Environment` - определяет на каком железе будет запускаться контейнер, который в последствии собирает проект (Ubuntu, AWS Linux, Windows)
- `Artifacts` -
- `Logs` - обозначает где будут хранится логи проекта, например логи сборки проекта

```
Почитай:
- System manager and Parametr store
- Terraform SSM
- env variables TF_VAR
- Реши проблему, что бы credentials не уходили в git hub, потому что access token сразу удаляется
```
