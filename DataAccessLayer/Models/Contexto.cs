using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Models
{
    public class Contexto : DbContext
    {
        public Contexto()
            : base("SIP")
        {
            System.Diagnostics.Debug.Print(Database.Connection.ConnectionString);
        }
       

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {          
            base.OnModelCreating(modelBuilder);

            modelBuilder.Conventions.Remove<OneToManyCascadeDeleteConvention>();
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();             
            
        }

        public override int SaveChanges()
        {

            var creados = this.ChangeTracker.Entries()
                            .Where(e => e.State == System.Data.Entity.EntityState.Added)
                            .Select(e => e.Entity).OfType<Generica>().ToList();

            foreach (var item in creados)
            {
                item.CreatedAt = DateTime.Now;
                item.CreatedBy = null;
            }

            var modificados = this.ChangeTracker.Entries()
                            .Where(e => e.State == System.Data.Entity.EntityState.Modified)
                            .Select(e => e.Entity).OfType<Generica>().ToList();

            foreach (var item in modificados)
            {
                item.EditedAt = DateTime.Now;
                item.EditedBy = null;
            }

            return base.SaveChanges();
            

        }

        public virtual DbSet<Ejercicio> Ejercicios { get; set; }
        public virtual DbSet<Año> Años { get; set; }
        public virtual DbSet<Municipio> Municipios { get; set; }
        public virtual DbSet<UnidadPresupuestal> UnidadesPresupuestales { get; set; }
        public virtual DbSet<TipoLocalidad> TiposLocalidad { get; set; }
        public virtual DbSet<SituacionObra> SituacionesObra { get; set; }
        public virtual DbSet<Fondo> Fondos { get; set; }
        public virtual DbSet<ModalidadFinanciamiento> ModalidadesFinanciamiento { get; set; }
        public virtual DbSet<Financiamiento> Financiamientos { get; set; }
        public virtual DbSet<AperturaProgramatica> AperturaProgramatica { get; set; }
        public virtual DbSet<AperturaProgramaticaMeta> AperturaProgramaticaMetas { get; set; }
        public virtual DbSet<AperturaProgramaticaUnidad> AperturaProgramaticaUnidades { get; set; }
        public virtual DbSet<AperturaProgramaticaBeneficiario> AperturaProgramaticaBeneficiarios { get; set; }
        public virtual DbSet<POA> POA { get; set; }
        public virtual DbSet<POADetalle> POADetalle { get; set; }
        public virtual DbSet<Obra> Obras { get; set; }
        public virtual DbSet<ObraFinanciamiento> ObraFinanciamientos { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }
        public virtual DbSet<Plantilla> Plantilla { get; set; }
        public virtual DbSet<PlantillaDetalle> PlantillaDetalle { get; set; }

    }
}
