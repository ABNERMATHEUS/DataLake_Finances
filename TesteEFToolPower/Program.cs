using AutoBogus;
using Bogus;
using System;
using System.Collections.Generic;
using System.Text;
using TesteEFToolPower.Data;
using TesteEFToolPower.Enum;
using TesteEFToolPower.Models;

namespace TesteEFToolPower
{
    public class Program
    {
        static void Main(string[] args)
        {
            try
            {
                Console.WriteLine("Começou...");
                for(int i = 0; i < 30; i++)
                {
                    PopularBancoComUmUsuario();
                    Console.WriteLine($"{i+1} Registro inserido com sucesso.");
                }
               
                Console.WriteLine("Finalizado.");
            }catch(Exception e)
            {
                Console.WriteLine(e.Message);
            }
            

        }

        public static void PopularBancoComUmUsuario()
        {
            FinancesContext financesContext = new FinancesContext();

            var faker = new Faker();
            var random = new Random();

            #region CRIANDO USUARIO
            var usuario = new Usuario() { 
                Nome = faker.Person.FirstName,
                Email = faker.Person.Email,
                Senha = faker.Person.UserName,
                Sobrenome = faker.Person.LastName
            };
            financesContext.Usuario.Add(usuario);
            financesContext.SaveChanges();
            var id_user = financesContext.Usuario.Where(x => x.Email == usuario.Email && x.Senha == usuario.Senha).FirstOrDefault();

                        #endregion
            
            #region CRIANDO CARTEIRA
            var carteira = new Carteira { Nome = $"Carteira do {usuario.Nome} {usuario.Sobrenome}",IdUsuario= id_user.IdUsuario };
            var carteira_database = financesContext.Carteira.Add(carteira).Entity;
            #endregion
            financesContext.SaveChanges();


            id_user = financesContext.Usuario.Where(x => x.Email == usuario.Email && x.Senha == usuario.Senha).FirstOrDefault();
            var id_carteira = id_user.Carteira.Where(x => x.Nome == carteira.Nome).First().IdCarteira;


            //5 registros
            for (int i = 0; i < 5; i++)
            {
                #region CRIANDO RECEBER
                var descricao_categoria = ((EReceber)random.Next(0, 4)).ToString();
                var receber = new Receber
                {
                    Descricao = descricao_categoria,
                    Valor = new Random().Next(2000, 8000),
                    Data = DateTime.Now.AddDays(2),
                    Categoria = descricao_categoria,
                    IdCarteira = id_carteira
                };
                financesContext.Receber.Add(receber);
                financesContext.SaveChanges();
                #endregion


                #region CRIANDO FORMA DE PAGAMENTO
                var nome_foma_pagamento = ((EFormaPagamento)random.Next(0, 4)).ToString();
                var id_forma_pagamento = financesContext.FormaPagamento.Where(x => x.Nome == nome_foma_pagamento).FirstOrDefault();
                if (id_forma_pagamento == null)
                {
                    var forma_pagamento = new FormaPagamento { Nome = nome_foma_pagamento };
                    financesContext.FormaPagamento.Add(forma_pagamento);
                    financesContext.SaveChanges();
                    id_forma_pagamento = financesContext.FormaPagamento.Where(x => x.Nome == nome_foma_pagamento).FirstOrDefault();
                }


                #endregion


                #region CRIANDO PAGAR
                descricao_categoria = ((EPagar)random.Next(0, 6)).ToString();
                var pagar = new Pagar
                {
                    Descricao = descricao_categoria,
                    Data = DateTime.Now.AddDays(22),
                    Pago = Convert.ToBoolean(random.Next(0, 1)),
                    Valor = random.Next(100, 500),
                    Categoria = descricao_categoria,
                    IdCarteira = carteira_database.IdCarteira,
                    IdFormaPagamento = id_forma_pagamento.IdFormaPagamento
                };

                financesContext.Pagar.Add(pagar);
                financesContext.SaveChanges();
                #endregion
            }


            #region INVESTIMENTO
            Investimento investimento = new Investimento
            {
                Descricao = $"Investimento do {usuario.Nome} {usuario.Sobrenome}",
                IdCarteira = id_carteira,
                NomeTipoInvestimento = ""
            };
            financesContext.Investimento.Add(investimento);
            financesContext.SaveChanges();
            var id_investimento = financesContext.Investimento.Where(x => x.IdCarteira == id_carteira && x.Descricao == investimento.Descricao).First().IdInvestimento;
            #endregion

            #region POUPANCA
            Poupanca poupanca = new Poupanca
            {
                IdInvestimento = id_investimento,
                Nome = faker.Random.Words(),

            };
            financesContext.Poupanca.Add(poupanca);
            financesContext.SaveChanges();
            #endregion

            #region PREVIDENCIA PRIVADA
            PrevidenciaPrivada previdenciaPrivada = new PrevidenciaPrivada {
                DataAplicacao = DateTime.Now,
                Nome = $"Previdência do {usuario.Nome}",
                Valor = random.Next(100, 500),
                IdInvestimento= id_investimento,

            };
            financesContext.PrevidenciaPrivada.Add(previdenciaPrivada);
            financesContext.SaveChanges();
            #endregion

            #region RENDA VARIAVEL
            RendaVariavel rendaVariavel = new RendaVariavel
            {
                DataAplicacao = DateTime.Now,
                IdInvestimento = id_investimento,
                Papel = ((EPapel)random.Next(0,4)).ToString(),
                ValorAplicado = random.Next(25, 35),
                Unidades = random.Next(30,7000),
            };
             
             financesContext.RendaVariavel.Add(rendaVariavel);
             financesContext.SaveChanges();
            #endregion



        }
    }
}
