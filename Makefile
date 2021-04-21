.PHONY: up build remake stop down restart rmi-local destroy \
				destroy-volumes ps \
				stg-init stg-plan stg-apply stg-destroy \
				prod-init prod-plan prod-apply prod-destroy check

up:
	docker-compose up -d
build:
	docker-compose build --no-cache --force-rm
remake:
	@make destroy
	@make init
stop:
	docker-compose stop
down:
	docker-compose down --remove-orphans
restart:
	@make down
	@make up
rmi-local:
	docker-compose down --rmi local --remove-orphans
destroy:
	docker-compose down --rmi all --volumes --remove-orphans
destroy-volumes:
	docker-compose down --volumes --remove-orphans
ps:
	docker-compose ps

stg-init:
	@docker-compose run --rm -w "/infra/terraform/env/stg" terraform terraform init

stg-plan:
	@docker-compose run --rm -w "/infra/terraform/env/stg" terraform terraform plan

stg-apply:
	@docker-compose run --rm -w "/infra/terraform/env/stg" terraform terraform apply

stg-destroy:
	@docker-compose run --rm -w "/infra/terraform/env/stg" terraform terraform destroy

prod-init:
	@docker-compose run --rm -w "/infra/terraform/env/prod" terraform terraform init

prod-plan:
	@docker-compose run --rm -w "/infra/terraform/env/prod" terraform terraform plan

prod-apply:
	@docker-compose run --rm -w "/infra/terraform/env/prod" terraform terraform apply

prod-destroy:
	@docker-compose run --rm -w "/infra/terraform/env/prod" terraform terraform destroy
