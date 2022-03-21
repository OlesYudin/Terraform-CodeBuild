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

## Security:

В AWS есть два ресурса для хранения чувствительных данных `secrets manager` и `service manager/parameter store`

- `secrets manager` - можно использовать для хранения паролей, токенов. **Цена: 0.4$ за одно значение в месяц**
- `parameter store` - в нем можно хранить любые внешние переменные, в том числе и чувствительные. Но, нельзя создать пару, к примеру username-password. Можно создать отдельно username и отдельно password, что не всегда удобно. **Цена: бесплатно**

Для того что бы запустить codebuild, нужно авторизоваться в аккаунте, где хранится код проекта, к примеру GitHub. В таком случае, codebuild должен знать либо: _username, password_; либо _Github OAuth token_. После создания токена, нужно его передать в AWS.

```
если токен от GitHub попадет в GitHub аккаунт, он удалится
```

У terraform есть ресурс `aws_codebuild_source_credential`, его можно использовать для передачи ключа в AWS

## ECS

Что бы изменить докер образ в task definition и он успешно вступил в силу, необходимо:

1. Вывести существующий task definition
2. Изменить тег или номер сборки task definition
3. Запустить новый task definition

### Пример скрипта для изменения task definition:

```
ECR_IMAGE="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${CODEBUILD_RESOLVED_SOURCE_VERSION}"
TASK_DEFINITION=$(aws ecs describe-task-definition --task-definition "$TASK_FAMILY" --region "$AWS_DEFAULT_REGION")
NEW_TASK_DEFINTIION=$(echo $TASK_DEFINITION | jq --arg IMAGE "$ECR_IMAGE" '.taskDefinition | .containerDefinitions[0].image = $IMAGE | del(.taskDefinitionArn) | del(.revision) | del(.status) | del(.requiresAttributes) | del(.compatibilities)')
NEW_TASK_INFO=$(aws ecs register-task-definition --region "$AWS_DEFAULT_REGION" --cli-input-json "$NEW_TASK_DEFINTIION")
NEW_REVISION=$(echo $NEW_TASK_INFO | jq '.taskDefinition.revision')
aws ecs update-service --cluster ${ECS_CLUSTER}--service ${SERVICE_NAME} --task-definition ${TASK_FAMILY}:${NEW_REVISION}
```
