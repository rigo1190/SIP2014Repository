namespace DataAccessLayer.Migrations
{
    using DataAccessLayer.Models;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<DataAccessLayer.Models.Contexto>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
        }

        protected override void Seed(DataAccessLayer.Models.Contexto context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            //

            context.Usuarios.AddOrUpdate(

               new Usuario { Id = 1, Login = "sedarpa", Password = "sedarpa", Nombre = "Usuario de SEDARPA", Activo = true },
               new Usuario { Id = 2, Login = "iiev", Password = "iiev", Nombre = "Usuario de IIEV", Activo = true },
               new Usuario { Id = 3, Login = "inverbio", Password = "inverbio", Nombre = "Usuario de INVERBIO", Activo = true }               
            );



            context.Ejercicios.AddOrUpdate(

               new Ejercicio { Id = 1, Año =2009,Activo=false },
               new Ejercicio { Id = 2, Año =2010,Activo=false },
               new Ejercicio { Id = 3, Año =2011,Activo=false },
               new Ejercicio { Id = 4, Año =2012,Activo=false },
               new Ejercicio { Id = 5, Año =2013,Activo=false },
               new Ejercicio { Id = 6, Año =2014,Activo=true },
               new Ejercicio { Id = 7, Año =2015,Activo=false },
               new Ejercicio { Id = 8, Año =2016,Activo=false }
            );

            context.UnidadesPresupuestales.AddOrUpdate(

              new UnidadPresupuestal { Id = 1, Clave = "102S11001", Abreviatura = "SEDARPA", Nombre = "Secretaria de Desarrollo Agropecuario, Rural y Pesca", Orden = 1 },
              new UnidadPresupuestal { Id = 2, Clave = "104C80803", Abreviatura = "IIEV", Nombre = "Instituto de Espacios Educativos", Orden = 2 },
              new UnidadPresupuestal { Id = 3, Clave = "104S80801", Abreviatura = "COBAEV", Nombre = "Colegio de Bachilleres del Estado de Veracruz", Orden = 3 }
              
           );

            UnidadPresupuestal sedarpa = context.UnidadesPresupuestales.Local.FirstOrDefault(u => u.Clave == "102S11001");

            sedarpa.DetalleSubUnidadesPresupuestales.Add(new UnidadPresupuestal { Id = 4, Clave = "102S80808", Abreviatura = "CODEPAP", Nombre = "Consejo de desarrollo del Papaloapan", Orden = 1 });
            sedarpa.DetalleSubUnidadesPresupuestales.Add(new UnidadPresupuestal { Id = 5, Clave = "102S80809", Abreviatura = "INVERBIO", Nombre = "Instituto Veracruzano de Bioenergéticos", Orden = 2 });



            Usuario usedarpa = context.Usuarios.Local.FirstOrDefault(u => u.Login == "sedarpa");
            Usuario uiiev = context.Usuarios.Local.FirstOrDefault(u => u.Login == "iiev");
            Usuario uinverbio = context.Usuarios.Local.FirstOrDefault(u => u.Login == "inverbio");

            usedarpa.DetalleUnidadesPresupuestales.Add(new UsuarioUnidadPresupuestal { UnidadPresupuestalId=1});
            uiiev.DetalleUnidadesPresupuestales.Add(new UsuarioUnidadPresupuestal { UnidadPresupuestalId = 2 });
            uinverbio.DetalleUnidadesPresupuestales.Add(new UsuarioUnidadPresupuestal { UnidadPresupuestalId = 5 });




            context.Municipios.AddOrUpdate(              
              new Municipio {Id=1,Clave="M001",Nombre="Acajete",Orden=1 },
              new Municipio {Id=2,Clave="M002",Nombre="Acatlán",Orden=2 },
              new Municipio {Id=3,Clave="M003",Nombre="Acayucan",Orden=3 },
              new Municipio {Id=4,Clave="M004",Nombre="Actopan",Orden=4 }              
            );

            context.TiposLocalidad.AddOrUpdate(
             new TipoLocalidad { Id = 1,Clave="TL001",Nombre="Poblado urbano",Orden=1},
             new TipoLocalidad { Id = 2,Clave="TL002",Nombre="Poblado rural",Orden=2},
             new TipoLocalidad { Id = 3,Clave="TL003",Nombre="Colonia popular",Orden=3},
             new TipoLocalidad { Id = 4,Clave="TL004",Nombre="Poblado indígena",Orden=4}
           );

           context.SituacionesObra.AddOrUpdate(
             new SituacionObra { Id = 1, Clave = "SO001", Nombre = "Nueva", Orden = 1 },
             new SituacionObra { Id = 2, Clave = "SO002", Nombre = "Proceso (Concluir financieramente)", Orden = 2 },
             new SituacionObra { Id = 3, Clave = "SO003", Nombre = "Proceso (Concluir fisica y financieramente)", Orden = 3 }
           
           );


           context.Fondos.AddOrUpdate(
             new Fondo { Id = 1, Clave = "F010", Abreviatura = "FORTAMUNDF", Nombre = "Fondo de Aportaciones para el Fortalecimiento de los Municipios y Demarcaciones Territoriales del Distrito Federal", Orden = 1 },
             new Fondo { Id = 2, Clave = "F020", Abreviatura = "FAIS", Nombre = "Fondo para la Infraestructura Social", Orden = 2 },
             new Fondo { Id = 3, Clave = "F030", Abreviatura = "Otros", Nombre = "Otros fondos", Orden = 3 }
           );

           Fondo fais = context.Fondos.Local.FirstOrDefault(f => f.Clave == "F010");
           fais.DetalleSubFondos.Add(new Fondo { Id = 4, Clave = "F011", Abreviatura = "FISE", Nombre = "Fondo para la Infraestructura Social Estatal", Orden = 1 });
           fais.DetalleSubFondos.Add(new Fondo { Id = 5, Clave = "F012", Abreviatura = "FISM", Nombre = "Fondo para la Infraestructura Social Municipal ", Orden = 2 });

           context.ModalidadesFinanciamiento.AddOrUpdate(
                new ModalidadFinanciamiento { Id = 1, Clave = "MF001", Nombre = "Actual", Orden = 1 },
                new ModalidadFinanciamiento { Id = 2, Clave = "MF002", Nombre = "Remanente", Orden = 2 },
                new ModalidadFinanciamiento { Id = 3, Clave = "MF003", Nombre = "Intereses", Orden = 3 },
                new ModalidadFinanciamiento { Id = 4, Clave = "MF004", Nombre = "Prestamo", Orden = 4 }
            );

           context.AperturaProgramaticaUnidades.AddOrUpdate(
               new AperturaProgramaticaUnidad { Id = 1, Clave = "APU001", Nombre = "Planta", Orden = 1 },
               new AperturaProgramaticaUnidad { Id = 2, Clave = "APU002", Nombre = "Pozo", Orden = 2 },
               new AperturaProgramaticaUnidad { Id = 3, Clave = "APU003", Nombre = "Tanque", Orden = 3 },
               new AperturaProgramaticaUnidad { Id = 4, Clave = "APU004", Nombre = "Metro lineal", Orden = 4 },
               new AperturaProgramaticaUnidad { Id = 5, Clave = "APU005", Nombre = "Sistema", Orden = 5 },
               new AperturaProgramaticaUnidad { Id = 6, Clave = "APU006", Nombre = "Obra", Orden = 6 },
               new AperturaProgramaticaUnidad { Id = 7, Clave = "APU007", Nombre = "Pozo", Orden = 7 },
               new AperturaProgramaticaUnidad { Id = 8, Clave = "APU008", Nombre = "Olla", Orden = 8}

           );

           context.AperturaProgramaticaBeneficiarios.AddOrUpdate(
             new AperturaProgramaticaBeneficiario { Id = 1, Clave = "APB001", Nombre = "Persona", Orden = 1 },
             new AperturaProgramaticaBeneficiario { Id = 2, Clave = "APB002", Nombre = "Productor", Orden = 2 },
             new AperturaProgramaticaBeneficiario { Id = 3, Clave = "APB003", Nombre = "Familia", Orden = 3 },
             new AperturaProgramaticaBeneficiario { Id = 4, Clave = "APB004", Nombre = "Alumno", Orden = 4 }

           );

           context.AperturaProgramatica.AddOrUpdate(
               new AperturaProgramatica { Id = 1, Clave = "SC", Nombre = "Agua y saneamiento (Agua potable)", Orden = 1, EjercicioId = 6 },
               new AperturaProgramatica { Id = 2, Clave = "SD", Nombre = "Agua y saneamiento (Drenaje)", Orden = 2, EjercicioId = 6 },
               new AperturaProgramatica { Id = 3, Clave = "SE", Nombre = "Urbanización municipal", Orden = 3, EjercicioId = 6 },
               new AperturaProgramatica { Id = 4, Clave = "SG", Nombre = "Electrificación", Orden = 4, EjercicioId = 6 },
               new AperturaProgramatica { Id = 5, Clave = "SO", Nombre = "Salud", Orden = 5, EjercicioId = 6 },
               new AperturaProgramatica { Id = 6, Clave = "SJ", Nombre = "Educación", Orden = 6, EjercicioId = 6 },
               new AperturaProgramatica { Id = 7, Clave = "SH", Nombre = "Vivienda", Orden = 7, EjercicioId = 6 },
               new AperturaProgramatica { Id = 8, Clave = "UB", Nombre = "Caminos rurales", Orden = 8, EjercicioId = 6 },
               new AperturaProgramatica { Id = 9, Clave = "IR", Nombre = "Infraestructura productiva rural", Orden = 9, EjercicioId = 6 },
               new AperturaProgramatica { Id = 10, Clave = "UM", Nombre = "Equipamiento urbano", Orden = 10, EjercicioId = 6 },
               new AperturaProgramatica { Id = 11, Clave = "PE", Nombre = "Protección y preservación ecológica", Orden = 11, EjercicioId = 6 },
               new AperturaProgramatica { Id = 12, Clave = "BE", Nombre = "Bienes muebles", Orden = 12, EjercicioId = 6 },
               new AperturaProgramatica { Id = 13, Clave = "BI", Nombre = "Bienes inmuebles", Orden = 13, EjercicioId = 6 },
               new AperturaProgramatica { Id = 14, Clave = "PM", Nombre = "Planeación municipal", Orden = 14, EjercicioId = 6 },
               new AperturaProgramatica { Id = 15, Clave = "SB", Nombre = "Estímulos a la educación", Orden = 15, EjercicioId = 6 }
            );

           AperturaProgramatica sc = context.AperturaProgramatica.Local.FirstOrDefault(ap => ap.Clave == "SC");

           sc.DetalleSubElementos.Add(new AperturaProgramatica { Id = 16, Clave = "01", Nombre = "Rehabilitación", Orden = 1, EjercicioId = 6 });
           sc.DetalleSubElementos.Add(new AperturaProgramatica { Id = 17, Clave = "02", Nombre = "Ampliación", Orden = 2, EjercicioId = 6 });
           sc.DetalleSubElementos.Add(new AperturaProgramatica { Id = 18, Clave = "03", Nombre = "Construcción", Orden = 3, EjercicioId = 6 });
           sc.DetalleSubElementos.Add(new AperturaProgramatica { Id = 19, Clave = "04", Nombre = "Mantenimiento", Orden = 4, EjercicioId = 6 });
           sc.DetalleSubElementos.Add(new AperturaProgramatica { Id = 20, Clave = "05", Nombre = "Equipamiento", Orden = 5, EjercicioId = 6 });
           sc.DetalleSubElementos.Add(new AperturaProgramatica { Id = 21, Clave = "06", Nombre = "Sustitución", Orden = 6, EjercicioId = 6 });

           AperturaProgramatica sc_rehabilitacion = context.AperturaProgramatica.Local.FirstOrDefault(ap => ap.Id == 16);

           sc_rehabilitacion.DetalleSubElementos.Add(new AperturaProgramatica { Id = 22, Clave = "a", Nombre = "Planta potabilizadora", Orden = 1, EjercicioId = 6 });
           sc_rehabilitacion.DetalleSubElementos.Add(new AperturaProgramatica { Id = 23, Clave = "b", Nombre = "Pozo profundo de agua potable", Orden = 2, EjercicioId = 6 });
           sc_rehabilitacion.DetalleSubElementos.Add(new AperturaProgramatica { Id = 24, Clave = "c", Nombre = "Deposito o tanque de agua potable", Orden = 3, EjercicioId = 6 });
           sc_rehabilitacion.DetalleSubElementos.Add(new AperturaProgramatica { Id = 25, Clave = "d", Nombre = "Linea de conducción", Orden = 4, EjercicioId = 6 });
           sc_rehabilitacion.DetalleSubElementos.Add(new AperturaProgramatica { Id = 26, Clave = "e", Nombre = "Red de agua potable", Orden = 5, EjercicioId = 6 });
           sc_rehabilitacion.DetalleSubElementos.Add(new AperturaProgramatica { Id = 27, Clave = "f", Nombre = "Sistema integral de agua potable", Orden = 6, EjercicioId = 6 });
           sc_rehabilitacion.DetalleSubElementos.Add(new AperturaProgramatica { Id = 28, Clave = "g", Nombre = "Carcamo", Orden = 7, EjercicioId = 6 });
           sc_rehabilitacion.DetalleSubElementos.Add(new AperturaProgramatica { Id = 29, Clave = "h", Nombre = "Norias", Orden = 8, EjercicioId = 6 });
           sc_rehabilitacion.DetalleSubElementos.Add(new AperturaProgramatica { Id = 30, Clave = "i", Nombre = "Pozo artesiano", Orden = 9, EjercicioId = 6 });
           sc_rehabilitacion.DetalleSubElementos.Add(new AperturaProgramatica { Id = 31, Clave = "j", Nombre = "Olla de captación de agua pluvial", Orden = 10, EjercicioId = 6 });

           AperturaProgramatica sc_rehabilitacion_plantapotabilizadora = context.AperturaProgramatica.Local.FirstOrDefault(ap => ap.Id == 22);

           sc_rehabilitacion_plantapotabilizadora.DetalleMetas.Add(new AperturaProgramaticaMeta { AperturaProgramaticaUnidadId = 8, AperturaProgramaticaBeneficiarioId = 1 });



           var list = from año in context.Años.Local
                      from mf in context.ModalidadesFinanciamiento.Local
                      from f in context.Fondos.Local
                      select new { año, mf, f };

           foreach (var item in list)
           {
               context.Financiamientos.Add(new Financiamiento { Año = item.año, ModalidadFinanciamiento = item.mf, Fondo = item.f });
           }

           POA poa = new POA { Id=1,UnidadPresupuestalId=1,EjercicioId=6};
                      
           POADetalle poadetalle = new POADetalle();          
           poadetalle.Numero = "102C8080150001";
           poadetalle.Descripcion = "Demolicion manual de cimentación de concreto armado con varilla de acero. Incluye: retiro de material a zona de acopio a 1ra estación de 20m.";
           poadetalle.MunicipioId = 1;
           poadetalle.Localidad = "Alguna localidad en Acajete";
           poadetalle.TipoLocalidadId = 1;
           poadetalle.SituacionObraId = 1;
           poadetalle.ModalidadObra = enumModalidadObra.Contrato;
           poadetalle.EsAccion = false;
           poadetalle.ImporteTotal = 12348700;
           poadetalle.AperturaProgramaticaId = 22;
           poadetalle.AperturaProgramaticaMetaId = 1;
           poadetalle.NumeroBeneficiarios = 25;
           poadetalle.CantidadUnidades = 17;

           poa.Detalles.Add(poadetalle);

           context.POA.Add(poa);


           Obra obra = new Obra();
           obra.Numero = "102C8080150001";
           obra.Descripcion = "Demolicion manual de cimentación de concreto armado con varilla de acero. Incluye: retiro de material a zona de acopio a 1ra estación de 20m.";
           obra.MunicipioId = 1;
           obra.Localidad = "Alguna localidad en Acajete";
           obra.TipoLocalidadId = 1;
           obra.SituacionObraId = 1;
           obra.ModalidadObra = enumModalidadObra.Contrato;
           obra.FechaInicio = new DateTime(2014, 01, 30);
           obra.FechaInicio = new DateTime(2014, 09, 16);
           obra.EsAccion = false;
           obra.ImporteTotal = 12348700;
           obra.AperturaProgramaticaId = 22;
           obra.AperturaProgramaticaMetaId = 1;
           obra.NumeroBeneficiarios = 25;
           obra.CantidadUnidades = 18;
          
           obra.POADetalle = poadetalle;

           context.Obras.Add(obra);

           context.SaveChanges();

           CrearTriggers(context);
      
           
        }


        private void CrearTriggers(Contexto contexto)
        {

            string sp001 = @" CREATE TRIGGER trgAsignarNumeroObra ON [dbo].[POADetalle] 
                                FOR INSERT
                                AS
	                               
									 declare @consecutivo int;
						             declare @UnidadPresupuestalClave varchar(9);
						             declare @anio int;
						             declare @poadetalleId int;
						             declare @poaId int;
						             declare @numeroObra varchar(100);

						             select @poaId=POAId,@poadetalleId=Id from inserted; 

                                     select

                                         @consecutivo=count(POADetalle.Id),							  
							             @UnidadPresupuestalClave=UnidadPresupuestal.Clave,
							             @anio=Ejercicio.Año							   

                                     from POADetalle 
                                     inner join POA
                                     on POA.Id=POADetalle.POAId
                                     inner join UnidadPresupuestal
                                     on UnidadPresupuestal.Id=POA.UnidadPresupuestalId
                                     inner join Ejercicio
                                     on Ejercicio.Id=POA.EjercicioId
                                     where POA.Id=@poaId
							         group by POA.Id,UnidadPresupuestal.Clave,Ejercicio.Año
                                     
							
							set @numeroObra= concat(@UnidadPresupuestalClave,@anio,REPLACE(STR(@consecutivo, 3),SPACE(1),'0'));

                            update POADetalle set POADetalle.Numero=@numeroObra where Id=@poadetalleId";



            contexto.Database.ExecuteSqlCommand(sp001);           


        } // Triggers






    }
}
