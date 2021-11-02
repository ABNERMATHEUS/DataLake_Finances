
using Microsoft.EntityFrameworkCore;
using PopularBancoFalso.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace PopularBancoFalso.Data
{
    public class DataContext : DbContext
    {
        public DataContext()
        {
        }

        public DataContext(DbContextOptions options) : base(options)
        {
        }


        public DbSet<Registro> Registros { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Data Source=localhost,1433;Initial Catalog=finances_fake_registro;Persist Security Info=True;User ID=sa;Password=R@@trootroot");           
        }


    }
}
