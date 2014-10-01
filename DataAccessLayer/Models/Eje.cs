﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Models
{
    public class Eje:Generica
    {
        public Eje() 
        {
            this.DetalleSubElementos = new HashSet<Eje>();
        }

        [Index(IsUnique = true)]
        [StringLength(50, ErrorMessage = "El campo {0} debe contener un máximo de {1} caracteres")]
        public string Clave { get; set; }       
        public string Descripcion { get; set; }

        [Index("IX_Orden_ParentId", 1, IsUnique = true)]
        public int Orden { get; set; }

        [Index("IX_Orden_ParentId", 2)]
        public int? ParentId { get; set; }
        public int? Nivel { get; set; }
        public virtual Eje Parent { get; set; }
        public virtual ICollection<Eje> DetalleSubElementos { get; set; }
    }
}
