using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;

namespace Datos
{
    public class DatosDias
    {
        AccesoDatos ds = new AccesoDatos();
        public DatosDias()
        {
        }

        public DataTable ObtenerTablaDias()
        {
            DataTable tabla = ds.CargarTabla("select Legajo_Medico as Legajo, Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo from DiasDeAtencion as d inner join Medicos as m on d.Legajo_Medico = m.Legajo where m.Activo != 0", "Dias");
            return tabla;
        }

        public DataTable ObtenerTablaDias(string filtro)
        {
            DataTable tabla = ds.CargarTabla("select Legajo_Medico as Legajo, Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo from DiasDeAtencion as d inner join Medicos as m on d.Legajo_Medico = m.Legajo where m.Activo !=0  "+filtro, "Dias");
            return tabla;
        }

        public Dia FncCargarDiasPorTabla(Dia dia, DataTable tabla)
        {
            dia.Lunes = bool.Parse(tabla.Rows[0][1].ToString());
            dia.Martes = bool.Parse(tabla.Rows[0][2].ToString());
            dia.Miercoles = bool.Parse(tabla.Rows[0][3].ToString());
            dia.Jueves = bool.Parse(tabla.Rows[0][4].ToString());
            dia.Viernes = bool.Parse(tabla.Rows[0][5].ToString());
            dia.Sabado = bool.Parse(tabla.Rows[0][6].ToString());
            dia.Domingo = bool.Parse(tabla.Rows[0][7].ToString());
            return dia;
        }
        public Dia ObtenerDiaEspecifico(Dia dia)
        {
            string legajo = new string(dia.Legajo);
            DataTable tabla = ds.CargarTabla("select Legajo_Medico as Legajo, Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo from DiasDeAtencion where Legajo_Medico ='" + legajo + "'", "Dias");            
            return FncCargarDiasPorTabla(dia, tabla); ;
        }  

        public bool ExisteDia(Dia dia)
        {
            string legajo = new string(dia.Legajo);
            string consulta = "Select Legajo_Medico from DiasDeAtencion where Legajo_Medico = '" + legajo + "'";
            return ds.Existe(consulta);
        }

        public bool AgregarDia(Dia dias)
        {
            string legajo = new string(dias.Legajo);
            bool exito = false;
            if (!ExisteDia(dias))
            {
                string consulta = "insert into DiasDeAtencion (Legajo_Medico,Lunes,Martes,Miercoles,Jueves,Viernes,Sabado,Domingo) VALUES ('"+ legajo + "','" + dias.Lunes.ToString() + "','"+ dias.Martes.ToString() + "','"+ dias.Miercoles.ToString() + "','"+ dias.Jueves.ToString() + "','"+ dias.Viernes.ToString() + "','"+ dias.Sabado.ToString() + "','"+ dias.Domingo.ToString() + "') ";
                int fueAgregado = ds.EjecutarConsulta(consulta);
                if(fueAgregado != 0) { exito = true; }
            }
            return exito;
        }

        public bool ModificarDias(Dia dias)
        {
            bool exito = false;
            if (ExisteDia(dias))
            {
                string legajo = new string(dias.Legajo);
                string consulta = "update DiasDeAtencion set Lunes ='"+dias.Lunes.ToString()+"',Martes ='"+dias.Martes.ToString()+"',Miercoles ='"+dias.Miercoles.ToString()+"',Jueves ='"+dias.Jueves.ToString()+"',Viernes ='"+dias.Viernes.ToString()+"',Sabado ='"+dias.Sabado.ToString()+"',Domingo ='"+dias.Domingo.ToString()+"' where Legajo_Medico ='"+legajo+"'";
                int fueModificado = ds.EjecutarConsulta(consulta);
                if(fueModificado != 0) { exito = true; }
            }
            return exito;
        }
    }
}
