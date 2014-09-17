using DataAccessLayer.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Linq;

namespace BusinessLogicLayer
{
    public class UnitOfWork : IDisposable
    {
        internal Contexto contexto;
        private List<String> errors = new List<String>();
        private IBusinessLogic<Municipio> municipioBusinessLogic;                             


        /// <summary>
        /// ////
        /// </summary>
        public UnitOfWork()
        {
            this.contexto = new Contexto();
        }

        public IBusinessLogic<Municipio> MunicipioBusinessLogic
        {
            get
            {
                if (this.municipioBusinessLogic == null)
                {
                    this.municipioBusinessLogic = new GenericBusinessLogic<Municipio>(contexto);
                }

                return municipioBusinessLogic;
            }
        }

     
        public void SaveChanges()
        {
            try
            {
                errors.Clear();
                contexto.SaveChanges();
            }
            catch (DbEntityValidationException ex)
            {

                this.RollBack();

                foreach (var item in ex.EntityValidationErrors)
                {

                    errors.Add(String.Format("Entity of type \"{0}\" in state \"{1}\" has the following validation errors", item.Entry.Entity.GetType().Name, item.Entry.State));

                    foreach (var error in item.ValidationErrors)
                    {
                        errors.Add(String.Format("Propiedad: \"{0}\", Error: \"{1}\"", error.PropertyName, error.ErrorMessage));
                    }


                }

            }
            catch (DbUpdateException ex)
            {
                this.RollBack();
                errors.Add(String.Format("{0}", ex.InnerException.InnerException.Message));
            }
            catch (System.InvalidOperationException ex)
            {
                this.RollBack();
                errors.Add(String.Format("{0}", ex.Message));
            }
            catch (Exception ex)
            {
                this.RollBack();
                errors.Add(String.Format("{0}\n{1}", ex.Message, ex.InnerException.Message));
            }
            
        }

        public List<String> Errors 
        {
            get 
            {
                return errors;
            }
        }


        public void RollBack()
        {
           
            var changedEntries = contexto.ChangeTracker.Entries().Where(e => e.State != EntityState.Unchanged);

            #region < Pendiente revisar, esto podria cancelar toda una sesión de trabajo >

            //foreach (var entry in changedEntries.Where(x => x.State == EntityState.Modified))
            //{
            //    entry.CurrentValues.SetValues(entry.OriginalValues);
            //    entry.State = EntityState.Unchanged;
            //}

            //foreach (var entry in changedEntries.Where(x => x.State == EntityState.Added))
            //{
            //    entry.State = EntityState.Detached;
            //} 

            #endregion

            foreach (var entry in changedEntries.Where(x => x.State == EntityState.Deleted))
            {
                entry.State = EntityState.Unchanged;
            }
            
        }
        
        private bool disposed = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    contexto.Dispose();
                }
            }
            this.disposed = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

    }
}
