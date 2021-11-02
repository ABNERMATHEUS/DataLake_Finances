using Bogus;
using PopularBancoFalso.Data;
using PopularBancoFalso.Enum;
using PopularBancoFalso.Models;
using System;

namespace PopularBancoFalso
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                Console.WriteLine("Começou...");
                DataContext dataContext = new DataContext();
                
                Random r = new Random();
                for (int id = 1; id <= 10000; id++)
                {
                    var faker = new Faker();
                    var categoria_pagar = ((EPagar)r.Next(0, 4)).ToString();
                    var categoria_receber = ((EReceber)r.Next(0, 4)).ToString();
                    var nome = faker.Person.FirstName;
                    var sobrenome = faker.Person.LastName;
                    var id_forma_pagamento = r.Next(0, 4);
                    var registro = new Registro()
                    {
                        /*IdUsuario = id,*/
                        IdUsuario_carteira = id,
                        IdUsuario_relatorio = id,
                        Categoria = categoria_receber,
                        Categoria_pagar = categoria_pagar,
                        Data = DateTime.Now.AddDays(r.Next(0, 60)),
                        DataAplicacao = DateTime.Now.AddDays(r.Next(0, 60)),
                        DataAplicacao_rendavariavel = DateTime.Now.AddDays(r.Next(0, 60)),
                        DataGeracao = DateTime.Now.AddDays(r.Next(0, 60)),
                        Data_pagar = DateTime.Now.AddDays(r.Next(0, 60)),
                        Data_nascimento = DateTime.Now.AddYears(-r.Next(20, 75)),
                        Descricao = categoria_receber,
                        Email = faker.Person.FirstName,
                        Telefone = faker.Person.Phone,
                        Sobrenome = faker.Person.LastName,
                        Valor_pagar = new Random().Next(2000, 8000),
                        Unidades = r.Next(100, 300),
                        Papel = ((EPapel)r.Next(0, 4)).ToString(),
                        Nome_carteira = $"Carteira do  {nome}",
                        Descricao_investimento = $"Investimento do {nome} {sobrenome}",
                        Descricao_pagar = categoria_pagar,
                        Nome_previdencia = $"Previdencia do {nome} {sobrenome}",
                        NomeTipoInvestimento = "",
                        Nome_forma_pagamento = ((EFormaPagamento)r.Next(0, 4)).ToString(),
                        Nome_poupanca = faker.Random.Words(),
                        Pago = Convert.ToBoolean(r.Next(0, 1)),
                        Image = faker.Person.Avatar,
                        ValorAplicado = r.Next(2000, 8000),
                        Valor_previdencia = r.Next(1, 200),
                        Valor = r.Next(2000, 8000),
                        Nome = nome,
                        Senha = faker.Internet.Password(),
                        Recebido = Convert.ToBoolean(r.Next(0, 1)),
                        IdCarteira = id,
                        IdCarteira_investimento = id,
                        IdCarteira_pagar = id,
                        IdCarteira_receber = id,
                        IdFormaPagamento = r.Next(0, 4),
                        IdFormaPagamento_pagar = id_forma_pagamento,
                        IdInvestimento = r.Next(2000, 8000),
                        IdInvestimento_poupanca = r.Next(2000, 8000),
                        IdInvestimento_previdencia = r.Next(2000, 8000),
                        IdInvestimento_rendavariavel = r.Next(2000, 8000),
                        IdPagar = r.Next(2000, 8000),
                        IdPoupanca = r.Next(2000, 8000),
                        IdPrevidencia = r.Next(2000, 8000),
                        IdReceber = r.Next(2000, 8000),
                        IdRelatorio = r.Next(2000, 8000),
                        IdVariavel = r.Next(2000, 8000),
                        TipoRelatorio = "NULL",
                        

                    };

                    dataContext.Registros.Add(registro);

                    
                    Console.WriteLine($"Inserindo {id} registro.");
                    
                }
                dataContext.SaveChanges();
                Console.WriteLine("Finalizou com sucesso!");

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

        }
    }
}
