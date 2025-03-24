using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Entidades
{
    public class Utilidades
    {
        public Utilidades()
        {
        }

        public char[] dividirCadenaEn2(string cadena)
        {
            char[] cadenaDividida = new char[2];


            for (int i = 0; i < 2; i++)
            {
                cadenaDividida[i] = cadena[i];
            }
            return cadenaDividida;


        }

        public char[] dividirCadenaEn4(string cadena)
        {
            char[] cadenaDividida = new char[4];


            for (int i = 0; i < 4; i++)
            {
                cadenaDividida[i] = cadena[i];
            }
            return cadenaDividida;


        }

        public char[] dividirCadenaEn8(string cadena)
        {
            char[] cadenaDividida = new char[8];


            for (int i = 0; i < 8; i++)
            {
                cadenaDividida[i] = cadena[i];
            }
            return cadenaDividida;


        }
    }
}
