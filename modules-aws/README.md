AWS Infrastructure 

📌 Introdução

Este repositório contém a infraestrutura provisionada na AWS para o projeto pessoal. A configuração segue boas práticas de segurança e escalabilidade.

🏗️ Arquitetura

A infraestrutura inclui:

Rede: VPC, sub-redes públicas e privadas.

Compute: EC2.

Banco de Dados: RDS.

Armazenamento: S3.

Segurança: IAM, Security Groups.

Monitoramento: CloudWatch, CloudTrail.

🚀 Como Deployar

Clone o repositório:

git clone https://github.com/Ravancardoso/terraform-providers-aws-udemy.git
c

Configure a AWS CLI:

aws configure

Execute Terraform.

terraform init
terraform apply

Boas Práticas

✔️ Use IAM Roles com menor privilégio.
✔️ Ative logs no CloudWatch para monitoramento.
✔️ Configure backups automáticos para RDS e S3.
✔️ Utilize tags para organização e gestão dos recursos.
✔️ Revise regularmente regras de segurança e permissões.