# Docker Compose & Terraform & AWS

## Usage
```
// ready container
$ make up

// delete container
$ make down

// terraformコマンド（stg→prodに変えれば別環境で実行できます）
$ make stg-init
$ make stg-plan
$ make stg-apply
$ make stg-destroy
```
