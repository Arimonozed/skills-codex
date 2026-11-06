# Skills do Codex — pacote portátil

Este repositório reúne **92 skills instaláveis**: as **25 skills pessoais** encontradas no PC, as **15 do Superpowers** e as coleções da **Vercel**. Quatro skills locais também pertencem ao Superpowers, e outras coincidem com as da Vercel. Para cada nome repetido, o pacote instala uma versão só, com preferência pela do PC. As versões alternativas continuam disponíveis em `originais/`.

## Instalar em outro PC com Windows

1. Extraia o ZIP ou clone este repositório. Abra o PowerShell na pasta que contém `instalar.ps1`.
2. Execute:

~~~powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\instalar.ps1
~~~

3. Abra o Codex e procure por `$napkin`, `$interface-design` ou `$find-skills`. Se as skills não aparecerem, reinicie o aplicativo.

O instalador copia as pastas para `$HOME/.agents/skills` ([local de skills pessoais do Codex](https://learn.chatgpt.com/docs/build-skills#where-codex-loads-local-skills)). Funciona sem internet, Node.js ou privilégios de administrador. Pastas já existentes no destino são preservadas integralmente. Algumas skills precisam de ferramentas próprias na hora de usar, como Git, Node.js, Vercel CLI ou serviços conectados.

| Se você quer… | Acrescente ao comando |
| --- | --- |
| Ver o que seria instalado, sem copiar nada | `-WhatIf` |
| Instalar só em um projeto | `-Destino '..agentsskills'` (use um caminho relativo ao seu projeto ou um caminho absoluto) |
| Usar o plugin oficial do Superpowers, sem duplicar suas skills | `-UsarPluginSuperpowers` |

## Superpowers

Por padrão, todas as 15 skills estão disponíveis como pastas individuais, usando as versões locais para Brainstorming, Systematic Debugging, TDD e Verification Before Completion. Para a integração com o namespace `superpowers:*` e o comportamento do plugin, instale **Superpowers** na seção **Plugins** do Codex e use `-UsarPluginSuperpowers` ao executar este instalador. Nesse modo, as 15 são puladas, inclusive a Brainstorming local; a versão local continua neste repositório. O modo plugin não remove instalações antigas.

## Conteúdo e origem

- `skills/`: versões instaladas por padrão, com seus scripts, referências e demais arquivos de apoio.
- `originais/`: variantes que têm o mesmo nome de uma versão já escolhida; ficam disponíveis para consulta ou troca manual.
- `catalogo.json`: inventário, origem de cada skill e commits das fontes externas.
- `licencas/`: licenças encontradas na raiz das fontes externas; avisos incluídos dentro de cada skill foram preservados.

As fontes externas são o [Superpowers](https://github.com/obra/superpowers), o [repositório Vercel Agent Skills](https://github.com/vercel-labs/agent-skills), os pacotes apontados pelo [catálogo oficial da Vercel](https://vercel.com/docs/agent-resources/skills) e as skills do [plugin Vercel](https://github.com/vercel/vercel-plugin). O pacote inclui as pastas de skills; instalações de plugins, integrações MCP, logins, configurações da conta, histórico e credenciais são separados.

A pasta extraída já é um repositório Git local. Se quiser sincronizá-la entre PCs pelo GitHub, use um repositório privado vazio como remoto. Nenhum remoto foi configurado neste pacote.

