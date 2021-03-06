// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;

#nullable disable

namespace TesteEFToolPower.Models
{
    public partial class Carteira
    {
        public Carteira()
        {
            Investimento = new HashSet<Investimento>();
            Pagar = new HashSet<Pagar>();
            Receber = new HashSet<Receber>();
        }

        public int IdCarteira { get; set; }
        public string Nome { get; set; }
        public int IdUsuario { get; set; }

        public virtual Usuario IdUsuarioNavigation { get; set; }
        public virtual ICollection<Investimento> Investimento { get; set; }
        public virtual ICollection<Pagar> Pagar { get; set; }
        public virtual ICollection<Receber> Receber { get; set; }
    }
}