# openfortigui-cli
___
## Script de gerenciamento de VPN OpenFortiGui

**Descrição:**

Este script em Bash foi desenvolvido para automatizar as tarefas de conexão, desconexão e gerenciamento de VPNs configuradas no OpenFortiGui. Ele oferece uma interface de linha de comando intuitiva para interagir com as VPNs, simplificando o processo e evitando erros manuais.

**Dependências**

Pacote [openfortigui](https://hadler.me/linux/openfortigui)

**Funcionalidades:**

* **Listagem de VPNs:** Exibe uma lista completa das VPNs disponíveis, facilitando a seleção.
* **Conexão:** Permite conectar a uma VPN específica pelo nome.
* **Desconexão:** Encerra a conexão ativa da VPN.
* **Verificação de status:** Mostra se a VPN está conectada ou não.
* **Verificação de log:** Exibe o log da última conexão iniciada para análise de problemas.
* **Interface interativa:** Oferece um menu simples para navegar pelas opções.

**Como usar:**

1. **Salvar o script:** Salve este script como um arquivo `.sh` (por exemplo, `openfortigui-cli.sh`) em um diretório de sua preferência.
2. **Tornar executável:** Execute o seguinte comando no terminal:
   ```bash
   chmod +x openfortigui-cli.sh
   ```
3. **Executar o script:** Execute o script diretamente no terminal:
   ```bash
   ./openfortigui-cli.sh
   ```
4. **Seguir as instruções:** Siga as instruções do menu para realizar as ações desejadas.

**Observações:**

* **Configuração:** Certifique-se de que o caminho para o arquivo `main.conf` do OpenFortiGui esteja correto no script.
* **Comando `openvpn`:** Se você estiver usando um cliente `openvpn` diferente, ajuste o comando de conexão no script.
* **Log:** O script salva os logs das conexões em um diretório temporário. Você pode personalizar o local de armazenamento dos logs.
* **Segurança:** **Não compartilhe** suas credenciais de VPN com ninguém.

**Contribuições:**

Contribuições são bem-vindas! Se você encontrar algum bug ou tiver sugestões de melhorias, abra um issue ou faça um fork do repositório.
