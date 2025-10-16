# AWS Infrastructure: 

## 🚀 Visão Geral do Projeto

Este repositório contém o código **Terraform** para provisionar uma infraestrutura completa e moderna na **Amazon Web Services (AWS)**. O objetivo é fornecer uma base **segura, escalável e bem organizada** para a implantação de uma aplicação.

---

## 🏗️ Arquitetura e Recursos

A infraestrutura é modular e utiliza os seguintes serviços da AWS:

| Serviço | Descrição |
| :--- | :--- |
| **Networking (VPC)** | Rede isolada com sub-redes públicas e privadas. |
| **Compute (EC2)** | Máquinas virtuais para rodar sua aplicação. |
| **Database (RDS)** | Banco de dados gerenciado para alta disponibilidade e escalabilidade. |
| **Storage (S3)** | Armazenamento de objetos para *assets* estáticos, backups e logs. |
| **Security Groups** | Firewalls virtuais para controlar o tráfego de entrada e saída. |
| **Observability** | Configurações básicas de CloudWatch e CloudTrail. |

⚠️ **Nota sobre IAM:** A gestão de usuários e *roles* do IAM ainda **não** está provisionada neste módulo. O acesso é feito via chaves locais, mas a implementação de **IAM Roles de menor privilégio** é a próxima prioridade.

---

## 💻 Pré-requisitos

Certifique-se de ter as seguintes ferramentas instaladas e configuradas antes de iniciar:

1.  **Git:** Para clonar o repositório.
2.  **AWS CLI:** Configurada com credenciais que tenham permissões de administrador (ou suficientes para criar os recursos).
3.  **Terraform:** Versão `v1.x` ou superior.

---

## 🛠️ Como Provisionar a Infraestrutura (Deploy)

Siga os passos abaixo para fazer o *deploy* da infraestrutura na sua conta AWS:

### 1. Clonar o Repositório

```bash
git clone [https://github.com/Ravancardoso/terraform-providers-aws-udemy.git](https://github.com/Ravancardoso/terraform-providers-aws-udemy.git)
cd terraform-providers-aws-udemy



2. Configurar a AWS
Certifique-se de que suas credenciais estão configuradas. O Terraform utilizará o perfil padrão da sua AWS CLI.



aws configure

3. Inicializar e Aplicar o Terraform
Execute os comandos padrão do Terraform para inicializar o backend, planejar as mudanças e, em seguida, provisionar os recursos

# 1. Inicializa o ambiente e baixa os providers
terraform init

# 2. Mostra um plano de execução (o que será criado)
terraform plan

# 3. Provisiona os recursos na AWS. Digite 'yes' para confirmar
terraform apply

✅ Boas Práticas e Segurança (Padrões Adotados)
Este módulo adere a um conjunto de boas práticas essenciais para a produção:

Princípio do Menor Privilégio: Os Security Groups são configurados estritamente para o acesso necessário.

Organização: Uso consistente de Tags em todos os recursos para facilitar a gestão e o controle de custos.

Durabilidade: Configuração de backups automáticos para serviços como RDS.

Monitoramento: Logs e métricas ativados (via CloudWatch/CloudTrail) para rastreamento de operações e performance.

Limpeza: O .gitignore está configurado para nunca comitar arquivos sensíveis (.tfstate, chaves, etc.).
