using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class AccesoDatos
    {
        private string _rutaBD = "Data Source=localhost\\sqlexpress; Initial Catalog=ClinicaTPI_PROG3; Integrated Security=True";

        public AccesoDatos()
        {
        }

        public AccesoDatos(string rutaBD)
        {
            _rutaBD = rutaBD;

        }

        public string Ruta
        {
            get { return _rutaBD; }
            set { _rutaBD = value; }
        }

        public SqlConnection IniciarConexion()
        {
            SqlConnection cn = new SqlConnection(this.Ruta);
            try
            {
                cn.Open();
                return cn;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public SqlDataAdapter CrearAdaptador(string consulta, SqlConnection conexion)
        {
            SqlDataAdapter adap;
            try
            {
                adap = new SqlDataAdapter(consulta, conexion);
                return adap;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public SqlCommand CrearSQLCommand(string consulta, SqlConnection conexion)
        {
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand(consulta, conexion);
                return cmd;
            }
            catch (Exception ex)
            {
                return null;
            }

        }

        public int EjecutarConsulta(string consulta)
        {
            int consultaEjecutada;
            SqlConnection cn = IniciarConexion();
            SqlCommand cmd = CrearSQLCommand(consulta, cn);
            consultaEjecutada = cmd.ExecuteNonQuery();
            cn.Close();

            return consultaEjecutada;
        }

        public DataTable CargarTabla(string consulta, string nombreTabla)
        {
            SqlConnection cn = IniciarConexion();
            SqlDataAdapter adap = CrearAdaptador(consulta, cn);
            DataSet ds = new DataSet();
            adap.Fill(ds, nombreTabla);
            cn.Close();
            return ds.Tables[0];

        }

        public bool Existe(string consulta)
        {
            bool estado = false;
            SqlConnection cn = IniciarConexion();
            SqlCommand cmd = CrearSQLCommand(consulta, cn);
            SqlDataReader datos = cmd.ExecuteReader();
            if (datos.Read())
            {
                estado = true;
            }
            return estado;

        }
    }
}
