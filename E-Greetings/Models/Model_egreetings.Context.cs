﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace E_Greetings.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class db_egreetingcardEntities1 : DbContext
    {
        public db_egreetingcardEntities1()
            : base("name=db_egreetingcardEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tb_cards> tb_cards { get; set; }
        public virtual DbSet<tb_category> tb_category { get; set; }
        public virtual DbSet<tb_feedback> tb_feedback { get; set; }
        public virtual DbSet<tb_roles> tb_roles { get; set; }
        public virtual DbSet<tb_userdetails> tb_userdetails { get; set; }
        public virtual DbSet<tb_newsletter> tb_newsletter { get; set; }
        public virtual DbSet<tb_trx> tb_trx { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
    
        public virtual ObjectResult<report_join_Result> report_join()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<report_join_Result>("report_join");
        }
    }
}
