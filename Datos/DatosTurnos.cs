using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;


namespace Datos
{
    public class DatosTurnos
    {
        AccesoDatos ds = new AccesoDatos();

        public DataTable ObtenerTablaTurnos()
        {
            DataTable tabla = ds.CargarTabla("select T.ID as ID, FORMAT(T.Fecha, 'dd/MM/yyyy') as Fecha, T.Horario as Horario, T.DNI_Paciente as [DNI del paciente], P.Apellido as [Apellido del paciente], T.Presente, T.Observacion from TURNOS as T inner join PACIENTES as P ON T.DNI_Paciente = P.DNI ", "Turnos");
            return tabla;
        }

        public DataTable ObtenerTablaTurnos(Turno turno)
        {
            string legajo = new string(turno.Legajo_Medico);
            DataTable tabla = ds.CargarTabla("select T.ID as ID, FORMAT(T.Fecha, 'dd/MM/yyyy') as Fecha, T.Horario as Horario, T.DNI_Paciente as [DNI del paciente], P.Apellido as [Apellido del paciente], T.Presente, T.Observacion from TURNOS as T inner join PACIENTES as P ON T.DNI_Paciente = P.DNI  where T.Legajo_Medico ='" + legajo+"'", "Turnos");
            return tabla;
        }

        public DataTable ObtenerTablaTurnos(string consulta)
        {
            DataTable tabla = ds.CargarTabla(consulta, "Turnos");
            return tabla;
        }

        public bool diaHorarioHablitadoParaTurno(Turno turno)
        {
            
            if (turno.Legajo_Medico[0] == 'M')
            {
                string legajo = new string(turno.Legajo_Medico);
                string consulta = "select * from TURNOS where Legajo_Medico='" + legajo + "' and fecha=CONVERT(DATE,'" + turno.Dia_Horario.ToString() + "', 103) and Horario='" + turno.Horario.ToString() + "' ";
                return !ds.Existe(consulta);
            }
            else
            {
                string dni = new string(turno.Dni_Paciente);
                string consulta = "select * from TURNOS where DNI_Paciente ='" + dni + "' and fecha=CONVERT(DATE,'" + turno.Dia_Horario.ToString() + "',103) and Horario='" + turno.Horario.ToString() + "' ";
                return !ds.Existe(consulta);
            }
            
        }

        public Turno CargarTurno(Turno turno,DataTable tabla)
        {
            Utilidades uti = new Utilidades();
            turno.Codigo = Int32.Parse(tabla.Rows[0][0].ToString());
            turno.Cod_Especialidad = uti.dividirCadenaEn4(tabla.Rows[0][1].ToString());
            turno.Legajo_Medico = uti.dividirCadenaEn4(tabla.Rows[0][2].ToString());
            turno.Dia_Horario = DateTime.Parse(tabla.Rows[0][3].ToString());
            turno.Horario = TimeSpan.Parse(tabla.Rows[0][4].ToString());
            turno.Dni_Paciente = uti.dividirCadenaEn8(tabla.Rows[0][5].ToString());
            turno.Presente = bool.Parse(tabla.Rows[0][6].ToString());
            turno.Observacion = tabla.Rows[0][7].ToString();
            return turno;
        }

        public Turno ObtenerTurnoEspecifico(string id)
        {
            Turno tur = new Turno();
            DataTable tabla = ds.CargarTabla("Select * from Turnos where ID ='"+id+"'","Turnos");
            return CargarTurno(tur, tabla);
        }

        public bool ExisteTurno(Turno tur)
        {
            string consulta = "select ID from Turnos where ID='" + tur.Codigo.ToString() + "'";
            return ds.Existe(consulta);
            
         
        }

        public bool AgregarTurno(Turno tur)
        {
            bool exito = false;
            if (!ExisteTurno(tur))
            {
                string codEsp = new string(tur.Cod_Especialidad);
                string dni = new string(tur.Dni_Paciente);
                string legajo = new string(tur.Legajo_Medico);

                string consulta = "insert into TURNOS (Cod_Especialidad,Legajo_Medico,Fecha,Horario,DNI_Paciente,Presente) VALUES ('" + codEsp + "','" + legajo + "',CONVERT(DATE,'" + tur.Dia_Horario.ToString() + "', 103),'" + tur.Horario.ToString() + "','" + dni + "','" + tur.Presente + "')";
                int fueAgregado = ds.EjecutarConsulta(consulta);
                if (fueAgregado != 0) { exito = true; }
            }
            return exito;
        }

        public bool ActualizarTurno(Turno tur)
        {
            bool exito = false;
            if (ExisteTurno(tur))
            {

                string codEsp = new string(tur.Cod_Especialidad);
                string dni = new string(tur.Dni_Paciente);
                string legajo = new string(tur.Legajo_Medico);

                string consulta = "update TURNOS set Cod_Especialidad = '"+ codEsp + "',Legajo_Medico = '"+ legajo + "',Fecha = '"+tur.Dia_Horario.ToShortDateString()+"',Horario = '"+tur.Horario.ToString()+"',DNI_Paciente = '"+ dni + "', Presente = '"+tur.Presente.ToString()+"',Observacion = '"+tur.Observacion.ToString()+"' where ID ='"+tur.Codigo+"'";
                int fueActualizado = ds.EjecutarConsulta(consulta);
                if(fueActualizado != 0) { exito = true; }
            }
            return exito;
        }

        public string PrimerInforme(string año1, string año2)
        {
            string informe1;
            DataTable tabla;
            if (int.Parse(año1) > int.Parse(año2))
            {
                 tabla= ds.CargarTabla("declare @T int = (select COUNT(T.ID) from TURNOS  as T where T.Fecha >= '01/01/" + año2 + "' and T.Fecha <= '12/31/" + año1 + "' ) declare @P int = (select COUNT(T.ID) from TURNOS as T where T.Presente = 0 and T.Fecha >= '01/01/" + año2 + "' and T.Fecha <= '12/31/" + año1 + "' ) select @T, @P", "Informe3");

            }
            else
            {
                tabla = ds.CargarTabla("declare @T int = (select COUNT(T.ID) from TURNOS  as T where T.Fecha >= '01/01/" + año1 + "' and T.Fecha <= '12/31/" + año2 + "' ) declare @P int = (select COUNT(T.ID) from TURNOS as T where T.Presente = 0 and T.Fecha >= '01/01/" + año1 + "' and T.Fecha <= '12/31/" + año2 + "' ) select @T, @P", "Informe3");

            }
            float porcentaje = (float.Parse(tabla.Rows[0][1].ToString()) * 100) / float.Parse(tabla.Rows[0][0].ToString());
            if (float.IsNaN(porcentaje)) informe1 = " no hay turnos asignados";
            else informe1 = " hubo un porcentaje de inasistencia del "+ String.Format("{0:0.00}", porcentaje).ToString()+"%";
            return informe1;
        }

        public string SegundoInforme(string especialidad)
        {
            string informe2;
            DataTable tabla= ds.CargarTabla("declare @P int = (select COUNT(T.ID) from TURNOS as T inner join ESPECIALIDADES as E on T.Cod_Especialidad = E.Codigo where E.Nombre like '"+especialidad+ "%' and T.Presente = 1) declare @T int = (select COUNT(T.ID) from TURNOS as T inner join ESPECIALIDADES as E on T.Cod_Especialidad = E.Codigo where E.Nombre like '" + especialidad + "%' ) select @T,@P","Informe2");
            float promedio = float.Parse(tabla.Rows[0][1].ToString()) / float.Parse(tabla.Rows[0][0].ToString());
            if (float.IsNaN(promedio)) informe2 = " es de 0";
            else informe2 = "es de " +promedio.ToString() ;

            return informe2;
        
        }

        public string TercerInforme(string dni)
        {
            string informe3;
            DataTable tabla = ds.CargarTabla("declare @T int = (select COUNT(T.ID) from TURNOS as T inner join PACIENTES as P on T.DNI_Paciente = P.DNI where T.DNI_Paciente ='" + dni+ "') declare @P int = (select COUNT(T.ID) from TURNOS as T inner join PACIENTES as P on T.DNI_Paciente = P.DNI where T.DNI_Paciente ='" + dni + "' and T.Presente = 1) select @T, @P", "Informe3");
            float porcentaje = (float.Parse(tabla.Rows[0][1].ToString()) * 100 )/ float.Parse(tabla.Rows[0][0].ToString());
            if (float.IsNaN(porcentaje)) informe3 = " no tiene turnos asignados";
            else informe3 = " tiene un porcentaje de asistencia del " + String.Format("{0:0.00}", porcentaje) + "%";
            return informe3;
        }




    }


}
