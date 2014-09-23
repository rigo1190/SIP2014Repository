using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Models
{
    public class POADetalle:Generica
    {
        [Index(IsUnique = true)]
        [StringLength(50, ErrorMessage = "El campo {0} debe contener un máximo de {1} caracteres")]
        public string Numero { get; set; }
        public string Descripcion { get; set; }
        public int MunicipioId { get; set; }
        public string Localidad { get; set; }
        public int TipoLocalidadId { get; set; }        
        public bool EsAccion { get; set; }
        public int POAId { get; set; }
        public int AperturaProgramaticaId { get; set; }
        public int AperturaProgramaticaMetaId { get; set; }
        public int NumeroBeneficiarios { get; set; }
        public int CantidadUnidades { get; set; }
        public int SituacionObraId { get; set; }
        public enumModalidadObra ModalidadObra { get; set; }
        public decimal ImporteTotal { get; set; }
        public string Observaciones { get; set; }
        public virtual POA POA { get; set; }
        public virtual Municipio Municipio { get; set; }
        public virtual TipoLocalidad TipoLocalidad { get; set; }
        public virtual AperturaProgramatica AperturaProgramatica { get; set; }
        public virtual AperturaProgramaticaMeta AperturaProgramaticaMeta { get; set; }
        public virtual SituacionObra SituacionObra { get; set; }
    }
}
