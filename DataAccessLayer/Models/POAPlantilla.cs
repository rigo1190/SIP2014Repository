using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Models
{
    public class POAPlantilla:Generica
    {
        public int POADetalleId { get; set; }
        public int PlantillaId { get; set; }
        public virtual POADetalle POADetalle { get; set; }
        public Plantilla Plantilla { get; set; }
        public virtual ICollection<POAPlantillaDetalle> Detalles { get; set; }

    }
}
