﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;

#nullable disable

namespace TesteEFToolPower.Models
{
    public partial class RendaVariavel
    {
        public int IdVariavel { get; set; }
        public string Papel { get; set; }
        public decimal ValorAplicado { get; set; }
        public int Unidades { get; set; }
        public DateTime DataAplicacao { get; set; }
        public int IdInvestimento { get; set; }

        public virtual Investimento IdInvestimentoNavigation { get; set; }
    }
}