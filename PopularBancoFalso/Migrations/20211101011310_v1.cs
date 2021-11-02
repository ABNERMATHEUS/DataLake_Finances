using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace PopularBancoFalso.Migrations
{
    public partial class v1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Registros",
                columns: table => new
                {
                    IdUsuario = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nome = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Sobrenome = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Senha = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Data_nascimento = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Telefone = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Image = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IdCarteira = table.Column<int>(type: "int", nullable: false),
                    Nome_carteira = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IdUsuario_carteira = table.Column<int>(type: "int", nullable: false),
                    IdFormaPagamento = table.Column<int>(type: "int", nullable: false),
                    Nome_forma_pagamento = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IdReceber = table.Column<int>(type: "int", nullable: false),
                    Descricao = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Valor = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    Recebido = table.Column<byte>(type: "tinyint", nullable: false),
                    Data = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Categoria = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IdCarteira_receber = table.Column<int>(type: "int", nullable: false),
                    IdPagar = table.Column<int>(type: "int", nullable: false),
                    Descricao_pagar = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Data_pagar = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Pago = table.Column<bool>(type: "bit", nullable: false),
                    Valor_pagar = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    Categoria_pagar = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IdCarteira_pagar = table.Column<int>(type: "int", nullable: false),
                    IdFormaPagamento_pagar = table.Column<int>(type: "int", nullable: false),
                    IdInvestimento = table.Column<int>(type: "int", nullable: false),
                    Descricao_investimento = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NomeTipoInvestimento = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IdCarteira_investimento = table.Column<int>(type: "int", nullable: false),
                    IdPoupanca = table.Column<int>(type: "int", nullable: false),
                    Nome_poupanca = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IdInvestimento_poupanca = table.Column<int>(type: "int", nullable: false),
                    IdPrevidencia = table.Column<int>(type: "int", nullable: false),
                    Nome_previdencia = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DataAplicacao = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Valor_previdencia = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    IdInvestimento_previdencia = table.Column<int>(type: "int", nullable: false),
                    IdVariavel = table.Column<int>(type: "int", nullable: false),
                    Papel = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ValorAplicado = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    Unidades = table.Column<int>(type: "int", nullable: false),
                    DataAplicacao_rendavariavel = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IdInvestimento_rendavariavel = table.Column<int>(type: "int", nullable: false),
                    IdRelatorio = table.Column<int>(type: "int", nullable: false),
                    TipoRelatorio = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DataGeracao = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IdUsuario_relatorio = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Registros", x => x.IdUsuario);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Registros");
        }
    }
}
