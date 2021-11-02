using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace PopularBancoFalso.Models
{
    public class Registro
    {
        #region USUARIO
        [Key ]
        public int IdUsuario { get; set; }
        public string Nome { get; set; }
        public string Sobrenome { get; set; }
        public string Email { get; set; }
        public string Senha { get; set; }

        public DateTime Data_nascimento { get; set; }

        public string Telefone { get; set; }

        public string Image { get; set; }
        #endregion

        #region CARTEIRA

        public int IdCarteira { get; set; }
        public string Nome_carteira { get; set; }
        public int IdUsuario_carteira { get; set; }
        #endregion

        #region FORMA_PAGAMENTO

        public int IdFormaPagamento { get; set; }
        public string Nome_forma_pagamento { get; set; }
        #endregion

        #region RECEBER

        public int IdReceber { get; set; }
        public string Descricao { get; set; }
        public decimal Valor { get; set; }
        public bool Recebido { get; set; }
        public DateTime Data { get; set; }
        public string Categoria { get; set; }
        public int IdCarteira_receber { get; set; }
        #endregion

        #region PAGAR
        public int IdPagar { get; set; }
        public string Descricao_pagar { get; set; }
        public DateTime Data_pagar { get; set; }
        public bool Pago { get; set; }
        public decimal Valor_pagar { get; set; }
        public string Categoria_pagar { get; set; }
        public int IdCarteira_pagar { get; set; }
        public int IdFormaPagamento_pagar { get; set; }
        #endregion

        #region INVESTIMENTO

        public int IdInvestimento { get; set; }
        public string Descricao_investimento { get; set; }
        public string NomeTipoInvestimento { get; set; }
        public int IdCarteira_investimento { get; set; }

        #endregion

        #region POUPANCA
        public int IdPoupanca { get; set; }
        public string Nome_poupanca { get; set; }
        public int IdInvestimento_poupanca { get; set; }
        #endregion

        #region PREVIDENCIA
        public int IdPrevidencia { get; set; }
        public string Nome_previdencia { get; set; }
        public DateTime DataAplicacao { get; set; }
        public decimal Valor_previdencia { get; set; }
        public int IdInvestimento_previdencia { get; set; }
        #endregion

        #region RENDA VARIAVEL
        public int IdVariavel { get; set; }
        public string Papel { get; set; }
        public decimal ValorAplicado { get; set; }
        public int Unidades { get; set; }
        public DateTime DataAplicacao_rendavariavel { get; set; }
        public int IdInvestimento_rendavariavel { get; set; }
        #endregion

        #region RELATORIO
        public int IdRelatorio { get; set; }
        public string TipoRelatorio { get; set; }
        public DateTime DataGeracao { get; set; }
        public int? IdUsuario_relatorio { get; set; }
        #endregion

    }
}
