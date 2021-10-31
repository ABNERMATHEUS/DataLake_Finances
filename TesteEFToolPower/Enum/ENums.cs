using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TesteEFToolPower.Enum
{
    public enum EReceber
    {
        Salario,
        Dividendos,
        Vendas,
        Aluguel,
        Freelas,
    }

    public enum EPagar
    {
        Aluguel,
        Boleto,
        Agua,
        Luz,
        IPVA,
        IPTU,
        Lazer,        
    }

    public enum EPapel
    {
        XPG11,
        PETR4,
        LWSA3,
        BID4,
        COGN3,

    }

    public enum EFormaPagamento
    {
        Dinheiro,
        Credito,
        Debito,
        Cheque,
        Bitcoin

    }
}
