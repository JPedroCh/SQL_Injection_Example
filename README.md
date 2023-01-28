## Sobre 
Exemplo simples de exploração de falha por injeção SQL.

## Execução

1 - Executar os scripts SQL encontrados na pasta `db` em sequência:
    
    1 - aula3exer1_Fisico.sql
    2 - aula3exer1_Popula.sql
    3 - aula3exer1_Controle.sql
    
2 - Executar:
    ```npm install ```

3 - Executar ```node  index.js```

## Explicacão:

No input o esperado é uma matrícula, entre 1 e 4, porém caso o usuário insira: "`1 OR 1 = 1`", por exemplo, todos os plantonistas são retornados, pois o "`OR 1 = 1`" é sempre verdadeiro.